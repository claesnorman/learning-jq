#!/usr/bin/env bash

# Working with the Transport For London API. Here we get the lines for the given travel mode.
# For this example we use the travel mode "tube", but you can change it to any of the available transport modes of TFL.
# Check the available transport modes in the get-transport-modes.sh file.
# Read more at https://api-portal.tfl.gov.uk/

travel_mode="tube"
curl -s -X GET https://api.tfl.gov.uk/Line/Mode/${travel_mode} | jq '.[].id'
