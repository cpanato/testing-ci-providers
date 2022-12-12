set -ex

go build -o cosign ./cosign/cmd/cosign
go build -o sget ./cosign/cmd/sget
tmp=$(mktemp -d -t cosign-e2e-secrets.XXXX)
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
COSIGN_KMS=$TEST_KMS ./cosign/cosign generate-key-pair
signing_key=$TEST_KMS

if (./cosign/cosign verify --key ${verification_key} $img); then false; fi
COSIGN_KEY=${signing_key} ./cosign/cosign sign $img
COSIGN_KEY=${verification_key} ./cosign/cosign verify $img

if (./cosign/cosign verify -a foo=bar --key ${verification_key} $img); then false; fi
COSIGN_KEY=${signing_key} ./cosign/cosign sign -a foo=bar $img
COSIGN_KEY=${verification_key} ./cosign/cosign verify -a foo=bar $img

# store signatures in a different repo
export COSIGN_REPOSITORY=${TEST_INSTANCE_REPO}/subbedrepo
# (crane delete $(./cosign triangulate $img)) || true
COSIGN_KEY=${signing_key} ./cosign/cosign sign $img
COSIGN_KEY=${verification_key} ./cosign/cosign verify $img
unset COSIGN_REPOSITORY

# test stdin interaction for private key password
stdin_password=${COSIGN_PASSWORD}
unset COSIGN_PASSWORD
# (crane delete $(./cosign triangulate $img)) || true
echo $stdin_password | ./cosign/cosign sign --key ${signing_key} --output-signature interactive.sig  $img
COSIGN_KEY=${verification_key} COSIGN_SIGNATURE=interactive.sig ./cosign/cosign verify $img
export COSIGN_PASSWORD=${stdin_password}

# What else needs auth?
echo "SUCCESS"