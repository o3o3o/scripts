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

log_error(){
    printf "$COLOR_RED ERROR: $COLOR_END"
    printf "$@\n"
}

log_waring(){
    printf "$COLOR_MAGENT WARINNG: $COLOR_END"
    printf "$@\n"
}
log_debug(){
    printf "$COLOR_GREEN DEBUG: $COLOR_END"
    printf "$@\n"
}
log_info(){
    printf "$COLOR_BLACK INFO: $COLOR_END"
    printf "$@\n"
}

