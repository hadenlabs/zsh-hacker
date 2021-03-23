#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function nmap {
    docker run --rm --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" nmap "${@}"
}

function nikto {
    docker run --rm --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" nikto "${@}"
}

function amap {
    docker run -it --rm -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" amap "${@}"
}

function urlscan::validate {
    if [ -z "${URLSCAN_API_KEY}" ]; then
        message_warning "URLSCAN_API_KEY is neccesary"
        return 0
    fi
}

# urlscan
function urlscan {
    local url
    hacker::urls::validate
    url="${1}"
    http POST https://www.virustotal.com/vtapi/v2/url/scan \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${url}"
}

function ip::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
}

function ipaddressreport {
    local ipaddress
    ip::validate
    ipaddress="${1}"

    http GET https://www.virustotal.com/vtapi/v2/ip-address/report \
         apikey=="${VIRUSTOTAL_API_KEY}" ip=="${ipaddress}"
}

function wireshark {
    docker run -it --rm -w /data -v "$(pwd)":/data -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority --net=host --privileged "${HACKER_KALI_DOCKER_IMAGE}" wireshark "${@}"
}