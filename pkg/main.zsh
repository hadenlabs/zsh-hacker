#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function hacker::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/tool/main.zsh

    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/research/main.zsh

    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/net/main.zsh

    # shellcheck source=/dev/null
    source "${ZSH_HACKER_SRC_PATH}"/pkg/brute/main.zsh
}

hacker::pkg::main::factory