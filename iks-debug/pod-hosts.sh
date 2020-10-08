#!/bin/bash
# Given a path to the pods.txt file produced from the debug tool
# outputs the pod name and scheduled worker info

# test for jq
command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq but it's not installed or not on the path.  Aborting."; exit 1; }

if [ ! -z "$1" ]; then
    cat $1 | jq -c '.body.items[] | {name: .metadata.name, scheduledon: .spec.nodeName}'
else
    echo "Error: Provide the path to the pods.txt file"
fi