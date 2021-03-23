#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hydra {
    docker run --name hydra --rm --net host --privileged \
        --volume "$(pwd)":/root/ --volume "$(pwd)":/data --volume /var/tmp:/tmp \
          ${HACKER_KALI_DOCKER_IMAGE} hydra "${@}"
}

function ncrack {
    docker run --name ncrack --rm --net host --privileged \
        --volume "$(pwd)":/root/ --volume "$(pwd)":/data --volume /var/tmp:/tmp \
          ${HACKER_KALI_DOCKER_IMAGE} ncrack "${@}"
}
