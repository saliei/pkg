# pacman specific operations

# if there is yay use it instead of pacman
type yay &>/dev/null && PKGCMD="yay" || PKGCMD="pacman"

function sync_mirrors() {
    echo "yay -Sy"
}

function upgrade_system() {
    echo "yay -Syu"
}

function query_package() {
    echo $1
    echo "yay -Qi $1"
}

function make_package() {
    echo $1
    echo "makepkg -si $1"
}

function remove_package() {
    echo $1
    echo "yay -R $1"
}

function purge_package() {
    echo $1
    echo "yay -Rcns $1"
}
