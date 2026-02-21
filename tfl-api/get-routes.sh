#!/usr/bin/env bash

# Working with the Transport For London API. Here we get the routes for the given line.
# For this example we use the line "piccadilly", but you can change it to any of the available lines of TFL.
# You can also provide multiple lines separated by comma, for example "piccadilly,central".
# Check the available lines in the get-lines.sh file.
# Read more at https://api-portal.tfl.gov.uk/

line="piccadilly"
curl -s -X GET https://api.tfl.gov.uk/Line/${line}/Route | jq -r '.routeSections[].name'
