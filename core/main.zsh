#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::core::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/core/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/core/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/core/linux.zsh
      ;;
    esac
}

hacker::core::main::factory