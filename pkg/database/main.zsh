#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::database::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/pkg/database/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/database/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/database/linux.zsh
      ;;
    esac
}

hacker::pkg::database::factory