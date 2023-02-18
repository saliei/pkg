#!/usr/bin/env bash
#
# parse the config file "pkg.conf"
#

# TODO: if it isn't there, copy one there
# TODO: don't read this conf file at every usage, an option for reloading the conf file

CONFILE="$HOME/.config/pkg/pkg.conf"

function create_config_file() {
    echo "creating config file"
}

[ ! -f $FILE ] && create_config_file
[ ! -r $FILE ] && { echo "can't read config file $FILE" 1>&2; exit 1; }

exec 3< "$CONFILE"
declare -A CONFARGS
OLDIFS="$IFS"
IFS=" = "

# remove any comments and white spaces before feeding the file to read
while read -r arg val; do
    CONFARGS["$arg"]="$val"
done <<<$(sed 's/[[:space:]]*#.*// ; /^[[:space:]]*$/d' <&3)

for arg in "${!CONFARGS[@]}"; do 
    echo "$arg:${CONFARGS[$arg]}" 
done

IFS="$OLDIFS"
exec 3<&-
exit 0


