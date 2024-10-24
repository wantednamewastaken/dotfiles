#!/usr/bin/env bash

#export MY_TMUX_SESSION_NAME=$(basename "$PWD")
MY_VAR="$(basename "$PWD")"
tmux set-environment -g MY_TEST "value"

