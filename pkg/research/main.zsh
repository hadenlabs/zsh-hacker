#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::research::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/research/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/research/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/pkg/research/linux.zsh
      ;;
    esac
}

hacker::pkg::research::main::factory