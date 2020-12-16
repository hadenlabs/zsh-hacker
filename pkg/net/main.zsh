#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::net::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/pkg/net/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/net/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/net/linux.zsh
      ;;
    esac
}

hacker::pkg::net::main::factory