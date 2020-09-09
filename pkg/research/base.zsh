#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function sherlock {
    local username
    username="${1}"
    docker run theyahya/sherlock "${username}" | fzf
}
