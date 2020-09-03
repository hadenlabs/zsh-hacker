#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::urls::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
}

function urlreport {
    local url
    hacker::urls::validate
    url="${1}"
    http GET https://www.virustotal.com/vtapi/v2/url/report \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${url}"
}

function urlscan {
    local url
    hacker::urls::validate
    url="${1}"
    http POST https://www.virustotal.com/vtapi/v2/url/scan \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${url}"
}
