#!/usr/bin/env bash

# Exercises
# =========

# 1. Get all user names
jq '.[].name' users.json

# 2. Get users where active == true
jq '.[] | select(.active)' users.json

# 3. Get names of users older than 25
jq '.[] | select(.age > 25) | .name' users.json

# 4. Count total users
jq '. | (length)' users.json

# 5. Get the first user
jq '.[0]' users.json

# 6. Sort users by age
jq '. | sort_by(.age)' users.json

# 7. Get only {name, age} fields
jq '[.[] | {"name": .name, "age": .age}]' users.json
