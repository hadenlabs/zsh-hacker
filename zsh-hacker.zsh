#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines functions hacker for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
#
ZSH_HACKER_PATH="$(dirname "${0}")"


# shellcheck source=/dev/null
source "${ZSH_HACKER_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_HACKER_PATH}"/core/main.zsh

# shellcheck source=/dev/null
source "${ZSH_HACKER_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_HACKER_PATH}"/pkg/main.zsh
