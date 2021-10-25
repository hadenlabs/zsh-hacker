#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function nmap {
    hacker::docker::run --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" nmap "${@}"
}

function rustscan {
    hacker::docker::run --name rustscan --net host --privileged rustscan/rustscan "${@}"
}

function telnet {
    hacker::docker::run --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" telnet "${@}"
}

function nikto {
    hacker::docker::run --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" nikto "${@}"
}

function amap {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" amap "${@}"
}

function sslscan {
    hacker::docker::run --net host --privileged "${HACKER_KALI_DOCKER_IMAGE}" sslscan "${@}"
}

function urlscan::validate {
    if [ -z "${URLSCAN_API_KEY}" ]; then
        message_warning "URLSCAN_API_KEY is necessary"
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
        message_warning "VIRUSTOTAL_API_KEY is necessary"
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
    hacker::docker::run -it --rm -w /data -v "$(pwd)":/data -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority --net=host --privileged "${HACKER_KALI_DOCKER_IMAGE}" wireshark "${@}"
}