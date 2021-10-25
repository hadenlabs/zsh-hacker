#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hydra {
    hacker:docker::run --name hydra --net host --privileged \
        --volume "$(pwd)":/root/ --volume "$(pwd)":/data --volume /var/tmp:/tmp \
          "${HACKER_KALI_DOCKER_IMAGE}" hydra "${@}"
}

function ncrack {
    hacker:docker::run --name ncrack --net host --privileged \
        --volume "$(pwd)":/root/ --volume "$(pwd)":/data --volume /var/tmp:/tmp \
          "${HACKER_KALI_DOCKER_IMAGE}" ncrack "${@}"
}
