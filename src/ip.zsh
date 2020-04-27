#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function ipaddressreport {
    local ipaddress
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
    ipaddress="${1}"

    http GET https://www.virustotal.com/vtapi/v2/ip-address/report \
         apikey=="${VIRUSTOTAL_API_KEY}" ip=="${ipaddress}"
} 