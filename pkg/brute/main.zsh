#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::brute::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/pkg/brute/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/brute/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/pkg/brute/linux.zsh
      ;;
    esac
}

hacker::pkg::brute::factory