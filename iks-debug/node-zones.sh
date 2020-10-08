#!/bin/bash
# Given a path to the nodes.txt file produced from the debug tool
# outputs the worker name, private ip, and region/zone info

# test for jq
command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq but it's not installed or not on the path.  Aborting."; exit 1; }

if [ ! -z "$1" ]; then
    cat $1| jq -c  '.body.items[] | {workername: .metadata.labels."ibm-cloud.kubernetes.io/worker-id", workerip: .metadata.name, region: .metadata.labels."topology.kubernetes.io/region", zone: .metadata.labels."topology.kubernetes.io/zone"}'
else
    echo "Error: Provide the path to the nodes.txt file"
fi