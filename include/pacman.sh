# pacman specific operations

function sync_mirrors() {
    yay -S
}

function upgrade_system() {
    yay -Syu
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
