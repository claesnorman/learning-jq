#!/usr/bin/env bash

# Exercises
# =========
json_file="company.json"

# 1. Get all employee names
jq '.employees[]' ${json_file}

# 2. Get employees in Engineering
jq '.employees[] | select(.department == "Engineering")' ${json_file}

# 3. Get all unique skills
jq '[.employees[].skills] | flatten | unique' ${json_file}

# 4. Count employees per department

# 5. Get employees who know "React"
jq '.employees[] | select(.skills | index("React"))' ${json_file}

# 6. Flatten all skills into a single array
jq '[.employees[].skills] | flatten' ${json_file}

# 7. Create output like:
#
# {
#   "Engineering": ["Alice", "Charlie"],
#   "Marketing": ["Bob"]
# }