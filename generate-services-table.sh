#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "No GCP project set!"
    exit 1
fi

GCP_PROJECT=$1

echo "Updating services table for GCP Project ${GCP_PROJECT}..."
echo "Checking Cloud Run services..."

gcloud run services list --project "${GCP_PROJECT}" --format=json > cloud.json

jq '[
  .[] | {
    kind: .kind,
    name: .metadata.name,
    squad: .metadata.labels.squad,
    location: .metadata.labels["cloud.googleapis.com/location"]
  }
] |
group_by(.squad) |
map({
  kind: .[0].kind,
  squad: .[0].squad,
  names: map(.name)| unique,
  locations: map(.location) | unique | join(", ")
})' cloud.json > intermediary.json


echo "| Kind | Name | Team | Locations | Playbooks |" > services_temp.md
echo "|------|------|-------|-----------|-----------|" >> services_temp.md
jq -r '
  .[] |
  .names[] as $name |
  "| " + .kind + " | " + $name + " | " + .squad + " | " + .locations + " | " + "[" + .squad + " Playbooks](../../playbooks/teams/" + .squad + "/services/)" + " |"' intermediary.json >> services_temp.md

NEW_TABLE=$(cat services_temp.md)

FILE="services.md"
TEMP_FILE="temp.md"

# Use sed to extract everything before the AUTOGEN block
sed -n '1,/<!-- AUTOGEN START SERVICES: automated genereted please do not edit -->/p' "${FILE}" > "${TEMP_FILE}"

# Append the new table, keeping the AUTOGEN START tag
echo "${NEW_TABLE}" >> "${TEMP_FILE}"

# Extract everything from the AUTOGEN END tag onwards
sed -n '/<!-- AUTOGEN END SERVICES: automated genereted please do not edit -->/,$p' "${FILE}" >> "${TEMP_FILE}"

# Replace the original file with the updated one
mv "${TEMP_FILE}" "${FILE}"

rm -f intermediary.json services_temp.md cloud.json "${TEMP_FILE}"

echo "Done Cloud Run services..."
echo "Checking Cloud Run jobs/crons..."

gcloud run jobs list --project "${GCP_PROJECT}" --format=json > cloud-jobs.json

jq '[
  .[] | {
    kind: .kind,
    name: .metadata.name,
    squad: .metadata.labels.squad,
    location: .metadata.labels["cloud.googleapis.com/location"]
  }
] |
group_by(.squad) |
map({
  kind: .[0].kind,
  squad: .[0].squad,
  names: map(.name)| unique,
  locations: map(.location) | unique | join(", ")
})' cloud-jobs.json > intermediary.json


echo "| Kind | Name | Team | Locations | Playbooks |" > services_temp.md
echo "|----- |------|-------|-----------|-----------|" >> services_temp.md
jq -r '
  .[] |
  .names[] as $name |
  "| " + .kind + " | " + $name + " | " + .squad + " | " + .locations + " | " + "[" + .squad + " Playbooks](../../playbooks/teams/" + .squad + "/services/)" + " |"' intermediary.json >> services_temp.md

NEW_TABLE=$(cat services_temp.md)

FILE="services.md"
TEMP_FILE="temp.md"

# Use sed to extract everything before the AUTOGEN block
sed -n '1,/<!-- AUTOGEN START JOBS: automated genereted please do not edit -->/p' "${FILE}" > "${TEMP_FILE}"

# Append the new table, keeping the AUTOGEN START tag
echo "${NEW_TABLE}" >> "${TEMP_FILE}"

# Extract everything from the AUTOGEN END tag onwards
sed -n '/<!-- AUTOGEN END JOBS: automated genereted please do not edit -->/,$p' "${FILE}" >> "${TEMP_FILE}"

# Replace the original file with the updated one
mv "${TEMP_FILE}" "${FILE}"

rm -f intermediary.json services_temp.md cloud-jobs.json "${TEMP_FILE}"

echo "Done Cloud Jobs services..."
echo "Table successfully updated in ${FILE}"
