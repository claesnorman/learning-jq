#!/usr/bin/env bash

# Sample jq filters, reading from the file people_db_01.json

json_file="people_db_01.json"

# Get all people with the name "John" - both these works, but the first one is more efficient
jq '.[] | select(.first_name == "John")' ${json_file}
cat ${json_file} | jq '.[] | select(.first_name == "John")'

# Get all people with the name "John", return them as a list
jq '[.[] | select(.first_name == "John")]' ${json_file}

# Get all people with the name "John" and only return their first name and surname, return them as a list
jq '[.[] | select(.first_name == "John") | {first_name, surname}]' ${json_file}

# Get all first names, return them as a list. Both these produce the same result
jq 'map(.first_name)' ${json_file}
jq '[.[].first_name]' ${json_file}

# Get first name + surname for all people, return them as a list
jq 'map(.first_name + " " + .surname)' ${json_file}

# Get first name + surname and a bool whether the person is alive, return them as a list
jq '[ .[] | {name: (.first_name + " " + .surname), stillAlive: (.date_of_death == null)}]' ${json_file}

# Get persons, sort by surname and then by first name, return them as a list
jq '[ .[] | {first_name: .first_name, surname: .surname, date_of_birth: .dob}] | sort_by(.surname, .first_name)' ${json_file}

# Get persons and how many languages they speak and a list of those languages, return them as a list
jq '[ .[] | {first_name: .first_name, surname: .surname, languages_spoken: (.languages | length), languages: [.languages[] | .language]} ]' ${json_file}

# Get all persons (one person per line and raw output, due to -r flag) and iterate over them in a for loop. 
persons=$(jq -r '.[] | (.first_name + "_" + .surname + "_" + .dob)' ${json_file})
for person in ${persons}; do
    echo "Person: ${person}"
done

# Get all persons' first names (one name per line and raw output, due to -r flag) and iterate over them in a for loop. Print when John is found or not found.
persons=$(jq -r '.[] | .first_name' ${json_file})
for person in ${persons}; do
    if [[ ${person} == "John" ]]; then
        echo "Found John!"
    else
        echo "No John here!"
    fi
done

# Get persons and their phone numbers as a CSV
jq -r '["first_name", "surname", "phone"], (.[] | [.first_name, .surname, .contact.phone]) | @csv' ${json_file}

# Get persons and years of experience, but only the persons with more than 5 years of experience.
jq '[ .[] | select(.years_of_experience >= 5) | {first_name: .first_name, surname: .surname, years_of_experience: .years_of_experience} ]' ${json_file}
