#!/usr/bin/env bash

# Get the available transport modes of TFL
# Read more at https://api-portal.tfl.gov.uk/

modes=$(curl -s -X GET https://api.tfl.gov.uk/Line/Meta/Modes | jq -r '.[].modeName')

echo "These are the available transport modes of TFL:"
echo "-----------------------------------------------"
for mode in $modes; do
    echo $mode
done

