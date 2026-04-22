#!/bin/bash

set -e
error_handling(){
    echo "occured at line number $1: error command:$2"
}
trap 'error_handling ${LINENO} "$BASH_COMMAND"' ERR



dnf installl mysql -y
