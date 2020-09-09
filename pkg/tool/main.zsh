#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::main::tool::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/tool/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/tool/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/tool/linux.zsh
      ;;
    esac
}

hacker::pkg::main::tool::factory