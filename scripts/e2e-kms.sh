set -ex

ls -la
cd  ${PWD}/cosign
go build -o cosign ./cmd/cosign
go build -o sget ./cmd/sget
tmp=$(mktemp -d -t cosign-e2e-secrets.XXXXXX)
cp cosign $tmp/
cp sget $tmp/

pushd $tmp

pass="$RANDOM"
export COSIGN_PASSWORD=$pass

BASE_TEST_REPO=${BASE_TEST_REPO:-ttl.sh/cosign-ci}
TEST_INSTANCE_REPO="${BASE_TEST_REPO}/$(date +'%Y/%m/%d')/$RANDOM"

## KMS using env variables!
TEST_KMS=${TEST_KMS:-hashivault://test}
# (crane delete $(./cosign triangulate $img)) || true
COSIGN_KMS=$TEST_KMS ./cosign generate-key-pair
signing_key=$TEST_KMS

if (./cosign verify --key ${verification_key} $img); then false; fi
COSIGN_KEY=${signing_key} ./cosign sign $img
COSIGN_KEY=${verification_key} ./cosign verify $img

if (./cosign verify -a foo=bar --key ${verification_key} $img); then false; fi
COSIGN_KEY=${signing_key} ./cosign sign -a foo=bar $img
COSIGN_KEY=${verification_key} ./cosign verify -a foo=bar $img

# store signatures in a different repo
export COSIGN_REPOSITORY=${TEST_INSTANCE_REPO}/subbedrepo
# (crane delete $(./cosign triangulate $img)) || true
COSIGN_KEY=${signing_key} ./cosign sign $img
COSIGN_KEY=${verification_key} ./cosign verify $img
unset COSIGN_REPOSITORY

# test stdin interaction for private key password
stdin_password=${COSIGN_PASSWORD}
unset COSIGN_PASSWORD
# (crane delete $(./cosign triangulate $img)) || true
echo $stdin_password | ./cosign sign --key ${signing_key} --output-signature interactive.sig  $img
COSIGN_KEY=${verification_key} COSIGN_SIGNATURE=interactive.sig ./cosign verify $img
export COSIGN_PASSWORD=${stdin_password}

# What else needs auth?
echo "SUCCESS"
