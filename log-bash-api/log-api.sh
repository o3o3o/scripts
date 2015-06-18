#!/bin/bash

COLOR_BLACK="\E[30m"
COLOR_RED="\E[31m"
COLOR_GREEN="\E[32m"
COLOR_YELLOW="\E[33m"
COLOR_BLUE="\E[34m"
COLOR_MAGENT="\E[35m"
COLOR_CYAN="\E[36m"
COLOR_WHITE="\E[37m"

COLOR_END="\E[0m"

log-error(){
    printf "$COLOR_RED ERROR: $COLOR_END"
    printf "$@\n"
}

log-waring(){
    printf "$COLOR_MAGENT ERROR: $COLOR_END"
    printf "$@\n"
}
log-debug(){
    printf "$COLOR_GREEN DEBUG: $COLOR_END"
    printf "$@\n"
}
log-info(){
    printf "$COLOR_BLACK DEBUG: $COLOR_END"
    printf "$@\n"
}

