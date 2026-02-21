#!/usr/bin/env bash

# Working with the Transport For London API. Here we get the arrivals for the given station.
# For this example we use the line "piccadilly" and the station "Piccadilly Circus Underground Station",
# but you can change them to any of the available lines and stations of TFL.
# Read more at https://api-portal.tfl.gov.uk/

# Get all arrivals for the given line and filter them by station name, then sort them by expected arrival time.
line="piccadilly"
stationName="Piccadilly Circus Underground Station"
curl -X GET https://api.tfl.gov.uk/Line/${line}/Arrivals | jq "[ .[] | select(.stationName == \"${stationName}\") | {platformName: .platformName, destinationName: .destinationName, expectedArrival: .expectedArrival} ]" | jq 'sort_by(.expectedArrival)'

# Get all arrivals for the given line and filter them by station name.
line="piccadilly"
stationName="Piccadilly Circus Underground Station"
curl -X GET https://api.tfl.gov.uk/Line/${line}/Arrivals | jq ".[] | select(.stationName == \"${stationName}\")"
