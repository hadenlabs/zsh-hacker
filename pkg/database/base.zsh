#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# Takes in $1 the python file to execute with sqlmap
function sqlmap {
    mkdir -p ~/.sqlmap
    hacker::docker::run -it \
           --volume ~/.sqlmap:/root/.sqlmap --volume "$(pwd)":/data --volume /tmp:/tmp \
           "${HACKER_KALI_DOCKER_IMAGE}" sqlmap "${@}"
}
