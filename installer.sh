#!/usr/bin/env bash
# 
# installer script for pkg
#

CURDIR="$(basename $0)"

function usage_message() {
    echo "usage message"

}

function install_pkg_path() {
    echo "install_pkg_path: $1"
}

function install_pkg() {
    [ -d "$HOME/.local/bin" ] || mkdir -p "$HOM/.local/bin"

    echo $?
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


