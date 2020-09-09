#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::main::tool::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/linux.zsh
      ;;
    esac
}

hacker::pkg::main::tool::factory