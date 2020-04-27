#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines functions hacker for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
#
HACKER_PLUGIN_DIR="$(dirname "${0}")"
HACKER_SOURCE_PATH="${HACKER_PLUGIN_DIR}"/src

export HACKER_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export HACKER_MESSAGE_NOT_FOUND="this not found installed"

# shellcheck source=/dev/null
source "${HACKER_SOURCE_PATH}"/base.zsh

# shellcheck source=/dev/null
source "${HACKER_SOURCE_PATH}"/utils.zsh

# cross::os functions for osx and linux
function cross::os {

    case "${OSTYPE}" in
        darwin*)
            # shellcheck source=/dev/null
            source "${HACKER_SOURCE_PATH}"/osx.zsh
            ;;
        linux*)
            # shellcheck source=/dev/null
            source "${HACKER_SOURCE_PATH}"/linux.zsh
            ;;
    esac

}

cross::os

# shellcheck source=/dev/null
source "${HACKER_SOURCE_PATH}"/docker.zsh

# shellcheck source=/dev/null
source "${HACKER_SOURCE_PATH}"/ip.zsh
