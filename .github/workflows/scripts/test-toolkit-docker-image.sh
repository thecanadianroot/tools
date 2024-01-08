#!/bin/bash

URL="http://localhost:8443"

for i in {1..3}; do
status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -L $URL)

if [[ $status_code -eq 200 ]]; then
    echo "URL returned 200 OK on attempt $i"
    break
else
    echo "Attempt $i: URL did not return 200 OK (Status: $status_code)"
    if [[ $i -lt 3 ]]; then
    echo "Retrying..."
    else
    echo "Max retries reached. Exiting."
    exit 1
    fi
fi

sleep 10
done