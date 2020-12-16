#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/config/linux.zsh
      ;;
    esac
}

hacker::config::main::factory