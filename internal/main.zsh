#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_HACKER_PATH}"/internal/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_PATH}"/internal/helper.zsh
}

hacker::internal::main::factory

if ! type -p http > /dev/null; then hacker::internal::http::install; fi
if ! core::exists ngrok > /dev/null; then core::install ngrok; fi
