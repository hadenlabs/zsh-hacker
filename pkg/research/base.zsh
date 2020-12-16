#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function sherlock {
    local username
    username="${1}"
    docker run theyahya/sherlock "${username}" | fzf
}

function googler::list {
    local site filetype name
    site="${1}"
    filetype="${2}"
    name="${3}"

    if [ -z "${name}" ] ; then
        googler -w "${site}" -n 20 --json "filetype:${filetype}" | jq '.[].url' | sed -e 's/^"//' -e 's/"$//'
        return
    fi
    googler -w "${site}"  -n 20 --json "filetype:${filetype}" "${name}" |jq '.[].url' | sed -e 's/^"//' -e 's/"$//'
}
