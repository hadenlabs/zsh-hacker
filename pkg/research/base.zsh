#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function sherlock {
    local username
    username="${1}"
    hacker::docker::run theyahya/sherlock "${username}" | fzf
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
    hacker::docker::run -it -w /data -v "$(pwd)":/data --net=host "${HACKER_KALI_DOCKER_IMAGE}" dnschef "${@}"
}

function dnsenum {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" dnsenum "${@}"
}

function dnsmap {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" dnsmap "${@}"
}

function dnsrecon {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" dnsrecon "${@}"
}

function dnswalk {
    hacker::docker::run -it "${HACKER_KALI_DOCKER_IMAGE}" dnswalk "${@}"
}

function searchsploit {
    hacker::docker::run "${HACKER_KALI_DOCKER_IMAGE}" searchsploit "${@}"
}

function burpsuite {
    hacker::docker::run -it -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority --net=host "${HACKER_KALI_DOCKER_IMAGE}" java -jar /usr/bin/burpsuite "${@}"
}

function commix {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" commix "${@}"
}

function dirb {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" dirb "${@}"
}

function hping3 {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" hping3 "${@}"
}

function kali-sh {
    hacker::docker::run -it --net=host --privileged -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority "${HACKER_KALI_DOCKER_IMAGE}" /bin/bash "${@}"
}

function msfconsole {
    hacker::docker::run -it --net=host  -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data "${HACKER_KALI_DOCKER_IMAGE}" msfconsole "${@}"
}

function msfvenom {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" msfvenom "${@}"
}

function ndiff {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" ndiff "${@}"
}

function dirsearch {
    hacker::docker::run -v "$(pwd)":/data hadenlabs/dirsearch "${@}"
}

function netdiscover {
    hacker::docker::run -it --net=host -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" netdiscover "${@}"
}

function padbuster {
    hacker::docker::run -it "${HACKER_KALI_DOCKER_IMAGE}" padbuster "${@}"
}

function reaver {
    hacker::docker::run -it --net=host --privileged -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" reaver "${@}"
}

function responder {
    hacker::docker::run -it --net=host "${HACKER_KALI_DOCKER_IMAGE}" responder "${@}"
}

function socat {
    hacker::docker::run -w /data -v "$(pwd)":/data --net=host "${HACKER_KALI_DOCKER_IMAGE}" socat "${@}"
}

function tshark {
    hacker::docker::run -w /data -v "$(pwd)":/data --net=host --privileged "${HACKER_KALI_DOCKER_IMAGE}" tshark "${@}"
}

function volafox {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" volafox "${@}"
}

function volatility {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" volatility "${@}"
}

function wash {
    hacker::docker::run -it -w /data -v "$(pwd)":/data --net=host --privileged "${HACKER_KALI_DOCKER_IMAGE}" wash "${@}"
}

function webscarab {
    hacker::docker::run -it -w /data -v "$(pwd)":/data -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority --net=host "${HACKER_KALI_DOCKER_IMAGE}" java -jar /usr/bin/webscarab "${@}"
}

function yersinia {
    hacker::docker::run -it -w /data -v "$(pwd)":/data "${HACKER_KALI_DOCKER_IMAGE}" yersinia "${@}"
}

function shodan {
    hacker::docker::run -it -w /data -v "$(pwd)":/data hadenlbas/shodan "${@}"
}

function zaproxy {
    hacker::docker::run -it -v ~/.ZAP:/root/.ZAP -e DISPLAY -v "${HOME}"/.Xauthority:/root/.Xauthority --net=host "${HACKER_KALI_DOCKER_IMAGE}" zaproxy "${@}"
}
