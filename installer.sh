#!/usr/bin/env bash
# 
# installer script for pkg
#
# TODO: better format width specification than this ad-hoc method

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
GITREPO="https://github.com/saliei/pkg.git"

function LOG() {
    CURDATE="${BLUE}$(date +'%Y-%m-%d %T')${RESET}"

    case $1 in
        "DEBUG")
            shift
            LOGLEVEL="${GREEN}   DEBUG${RESET}"
            ;;
        "INFO")
            shift
            LOGLEVEL="${CYAN}    INFO${RESET}"
            ;;
        "WARNING")
            shift
            LOGLEVEL="${YELLOW} WARNING${RESET}"
            ;;
        "ERROR")
            shift
            LOGLEVEL="${RED}   ERROR${RESET}"
            ;;
        "CRITICAL")
            shift
            LOGLEVEL="${BRED}CRITICAL${RESET}"
            ;;
        *)
            LOGLEVEL="${WHITE} NOLEVEL${RESET}"
            ;;
    esac

    LOGMSG="$1"
    echo -e "$CURDATE $LOGLEVEL: $LOGMSG"
}

function usage_message() {
    echo "usage message"
}


# TODO: move all the preparatory stuff to another function
function install_pkg() {
    [[ -z "$1" ]] && BINDIR="$HOME/.local/bin" || BINDIR="$1"
    LOG WARNING "setting install path to '$BINDIR'"

    if [[ -d "$BINDIR" ]]; then
        LOG DEBUG "'$BINDIR' exists, using that"
    else
        LOG INFO "'$BINDIR' doesn't exists, creating"
        mkdir -p "$BINDIR"
    fi

    if [[ ":$PATH:" == *":$BINDIR:"* ]]; then
        LOG INFO "'$BINDIR' is already in PATH"
    else
        LOG WARNING "'$BINDIR' is not in PATH, consider adding it"
    fi

    # TODO: check if we're currently in pkg repo and all the required files are there, otherwise do all this stuff
    type git &>/dev/null || { LOG CRITICAL "can't find git command, make sure it is installed!"; exit 1; }

    TMPDIR="$(mktemp -d -t pkg.XXX || { LOG CRITICAL "can't create a temporary directory using 'mktemp'"; exit 1; })"
    LOG DEBUG "clong 'pkg' repo to $TMDIR"
    git clone "$GITREPO" "$TMPDIR"
    if [[ $? != 0 ]]; then
        LOG CRITICAL "an error occured during cloning 'pkg' repo at: '$GITREPO'" 
        exit 1
    else
        LOG INFO "finished cloning 'pkg' repo at: '$GITREPO'"
    fi

    ( cd "$TMPDIR" && ls .. )


    rm -rf "$TMPDIR" && LOG INFO "removed temporary cloned repo at: '$TMPDIR'"


}

function main() {
    case $1 in 
        "")
            install_pkg
            ;;
        "--path" | "-p")
            shift
            install_pkg "$@"
            ;;
        *)
            usage_message
            ;;
    esac
}

main "$@"
