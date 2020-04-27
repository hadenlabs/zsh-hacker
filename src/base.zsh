#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# http::install - install http
function http::install {
    if ! type -p pip > /dev/null; then
        message_warning "${FUNCTIONS_MESSAGE_PYENV}"
        return
    fi
    message_info "Install http"
    pip install --user httpie
    message_success "Installed http"
}

if ! type -p http > /dev/null; then http::install; fi