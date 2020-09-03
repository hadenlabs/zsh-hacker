#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_SRC_PATH}"/internal/linux.zsh
      ;;
    esac
}

hacker::internal::main::factory