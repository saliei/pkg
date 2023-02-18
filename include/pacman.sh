# pacman specific operations
# TODO: test to see if even pacman exists!

# if there is yay use it instead of pacman
type yay &>/dev/null && PKGCMD="yay" || PKGCMD="pacman"

function query_usage() {
    echo "query usage message"
}

function sync_mirrors() {
    "$PKGCMD" -Sy
}

function upgrade_system() {
    "$PKGCMD" -Syu
}

function query_package() {
    case "$1" in
        "local" | "-l")
            shift
            "$PKGCMD" -Ss "$@"
            ;;
        "remote" | "-r")
            shift
            "$PKGCMD" -Ss "$@"
            ;;
        "all" | "-a")
            # TODO: make this option the default one
            shift
            "$PKGCMD" -Ss "$@"
            ;;
        *)
            query_usage
            ;;
    esac
}

function make_package() {
    makepkg -si "$1"
}

function remove_package() {
    "$PKGCMD" -R "$1"
}

function purge_package() {
    "$PKGCMD" -Rcns "$1"
}
