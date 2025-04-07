#!/bin/bash

# Define the file to update
FILE="services.md"
TEMP_FILE="temp.md"

# Define the new table content
NEW_TABLE='| Name | Team | Locations | Playbooks |
|------|-------|-----------|-----------|
| [new-serssssvice-1](#new-service-1) | acceleration | us-central1, us-east4, us-west1 | https://xxx.engineering/docs/playbooks/acceleration/services.md |
| [new-servisssce-2](#new-service-2) | acceleration | us-central1, us-east4, us-west1 | https://xxx.engineering/docs/playbooks/acceleration/services.md |'

# Extract everything before the AUTOGEN block, keeping the START marker
sed -n '1,/<!-- AUTOGEN START SERVICES: automated genereted please do not edit -->/p' "$FILE" > "$TEMP_FILE"

# Append the new table inside the AUTOGEN block
echo "$NEW_TABLE" >> "$TEMP_FILE"

# Extract everything from the END marker onwards, keeping it in place
sed -n '/<!-- AUTOGEN END SERVICES: automated genereted please do not edit -->/,$p' "$FILE" >> "$TEMP_FILE"

# Replace the original file with the updated one
mv "$TEMP_FILE" "$FILE"

echo "Table successfully updated in $FILE"
