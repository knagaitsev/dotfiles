#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <message>"
    exit 1
fi

git add -u && git commit -m "$1" && git push

