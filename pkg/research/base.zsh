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

function dnschef {
    docker run -it --rm -w /data -v $(pwd):/data --net=host ${HACKER_KALI_DOCKER_IMAGE} dnschef "${@}"
}

function dnsenum {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} dnsenum "${@}"
}

function dnsmap {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} dnsmap "${@}"
}

function dnsrecon {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} dnsrecon "${@}"
}

function dnswalk {
    docker run -it --rm ${HACKER_KALI_DOCKER_IMAGE} dnswalk "${@}"
}

function searchsploit {
    docker run --rm ${HACKER_KALI_DOCKER_IMAGE} searchsploit "${@}"
}

function burpsuite {
    docker run -it --rm -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net=host ${HACKER_KALI_DOCKER_IMAGE} java -jar /usr/bin/burpsuite "${@}"
}

function commix {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} commix "${@}"
}

function dirb {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} dirb "${@}"
}

function hping3 {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} hping3 "${@}"
}

function kali-sh {
    docker run -it --rm --net=host --privileged -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority ${HACKER_KALI_DOCKER_IMAGE} /bin/bash "${@}"
}

function msfconsole {
    docker run -it --rm --net=host  -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data ${HACKER_KALI_DOCKER_IMAGE} msfconsole "${@}"
}

function msfvenom {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} msfvenom "${@}"
}

function ndiff {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} ndiff "${@}"
}

function netdiscover {
    docker run -it --rm --net=host -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} netdiscover "${@}"
}

function padbuster {
    docker run -it --rm ${HACKER_KALI_DOCKER_IMAGE} padbuster "${@}"
}

function reaver {
    docker run -it --rm --net=host --privileged -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} reaver "${@}"
}

function responder {
    docker run -it --rm --net=host ${HACKER_KALI_DOCKER_IMAGE} responder "${@}"
}

function socat {
    docker run --rm -w /data -v $(pwd):/data --net=host ${HACKER_KALI_DOCKER_IMAGE} socat "${@}"
}

function tshark {
    docker run --rm -w /data -v $(pwd):/data --net=host --privileged ${HACKER_KALI_DOCKER_IMAGE} tshark "${@}"
}

function volafox {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} volafox "${@}"
}

function volatility {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} volatility "${@}"
}

function wash {
    docker run -it --rm -w /data -v $(pwd):/data --net=host --privileged ${HACKER_KALI_DOCKER_IMAGE} wash "${@}"
}

function webscarab {
    docker run -it --rm -w /data -v $(pwd):/data -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net=host ${HACKER_KALI_DOCKER_IMAGE} java -jar /usr/bin/webscarab "${@}"
}

function yersinia {
    docker run -it --rm -w /data -v $(pwd):/data ${HACKER_KALI_DOCKER_IMAGE} yersinia "${@}"
}

function zaproxy {
    docker run -it --rm -v ~/.ZAP:/root/.ZAP -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net=host ${HACKER_KALI_DOCKER_IMAGE} zaproxy "${@}"
}
