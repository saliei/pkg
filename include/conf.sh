#!/usr/bin/env bash
#
# parse the config file "pkg.conf"
#

# TODO: if it isn't there, copy one there
# TODO: tokenize using the read command itself!

CONFILE="$HOME/.config/pkg/pkg.conf"

function create_config_file() {
    echo "creating config file"
}

[ ! -f $FILE ] && create_config_file
[ ! -r $FILE ] && { echo "can't read config file $FILE" 1>&2; exit 1; }

exec 3< "$CONFILE"

IFS=$(echo -en "\n\b")
while read -u 3 -r line; do
    echo $line
    echo "...end..."
done

# close the file
exec 3<&-
exit 0


