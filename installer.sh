#!/usr/bin/env bash
# 
# installer script for pkg
#
# TODO: better format width specification than this ad-hoc method

# exit on any errors
set -e

BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
BGREEN="\033[1;32m"
BRED="\033[1;31m"
RESET="\033[0m"

CURDIR="$(basename $0)"

function LOG() {
    CURDATE="${BLUE}$(date +'%Y-%m-%d %T')${RESET}"

    case $1 in
        "DEBUG")
            shift
            LOGLEVEL="${GREEN}   DEBUG:${RESET}"
            ;;
        "INFO")
            shift
            LOGLEVEL="${CYAN}    INFO:${RESET}"
            ;;
        "WARNING")
            shift
            LOGLEVEL="${YELLOW} WARNING:${RESET}"
            ;;
        "ERROR")
            shift
            LOGLEVEL="${RED}   ERROR:${RESET}"
            ;;
        "CRITICAL")
            shift
            LOGLEVEL="${BRED}CRITICAL:${RESET}"
            ;;
        *)
            LOGLEVEL="${WHITE} NOLEVEL:${RESET}"
            ;;
    esac

    LOGMSG="$1"
    echo -e "$CURDATE $LOGLEVEL $LOGMSG"
}

function usage_message() {
    echo "usage message"
}

function install_pkg_path() {
    echo "install_pkg_path: $1"
}

function install_pkg() {
    [ -d "$HOME/.local/bin" ] || mkdidr -p "$HOME/.local/bin"

    LOG DEBUG "sdsdvdv"
    LOG INFO "this is done"
    LOG WARNING "this is NOT done"
    LOG ERROR "sdvvvvv"
    LOG CRITICAL "sdcsdv"
    LOG "sdsdv"



}

function main() {
    case $1 in 
        "")
            install_pkg
            ;;
        "--path" | "-p")
            shift
            install_pkg_path "$@"
            ;;
        *)
            usage_message
            ;;
    esac
}

main "$@"


