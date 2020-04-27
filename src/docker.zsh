#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# Takes in $1 the python file to execute with sqlmap
function sqlmap {
    mkdir -p ~/.sqlmap
    docker run --rm -it \
           --volume ~/.sqlmap:/root/.sqlmap --volume "$(pwd)":/data --volume /tmp:/tmp \
           booyaabes/kali-linux-full sqlmap "${@}"
}

# urlscan
function urlscan {
    if [ -z "${URLSCAN_API_KEY}" ]; then
        message_warning "URLSCAN_API_KEY is neccesary"
        return 0
    fi
    mkdir -p ~/.urlscan
    docker run --rm -i \
           -v ~/.urlscan:/root/.urlscan heywoodlh/urlscan-py:latest "${@}" --api "${URLSCAN_API_KEY}"
}

function nmap {
    docker run --rm -i weshigbee/nmap "${@}"
}