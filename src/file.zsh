#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::file::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
}


function filereport {
    local filename
    hacker::file::validate
    filename="${1}"
    http GET https://www.virustotal.com/vtapi/v2/file/report \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${filename}"
}

function filescan {
    local filename
    hacker::file::validate
    filename="${1}"
    http -f POST https://www.virustotal.com/vtapi/v2/file/scan \
         apikey=="${VIRUSTOTAL_API_KEY}" file==@"${filename}"
}

function filerescan {
    local filename
    hacker::file::validate
    filename="${1}"
    http POST https://www.virustotal.com/vtapi/v2/file/rescan \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${filename}"
}