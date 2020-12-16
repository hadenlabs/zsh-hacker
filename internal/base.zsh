#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# http::install - install http
function hacker::internal::http::install {
    message_info "Installing httpie"
    if ! type -p pip > /dev/null; then
        message_warning "${HACKER_MESSAGE_PYENV}"
        return
    fi
    pip install --user httpie
    message_success "Installed httpie"
}

function hacker::internal::googler::install {
    message_info "Installing googler"
    if ! type -p pip > /dev/null; then
        message_warning "${HACKER_MESSAGE_BREW}"
        return
    fi
    brew install googler
    message_success "Installed googler"
}
