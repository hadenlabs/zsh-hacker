#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hydra {
    docker run --name hydra --rm --net host --privileged \
        --volume "$(pwd)":/root/ --volume "$(pwd)":/data --volume /var/tmp:/tmp \
          booyaabes/kali-linux-full hydra "${@}"
}