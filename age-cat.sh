#!/bin/sh

[ "$PAGER" = "" ] && PAGER=less

if [ "$1" = "" ]; then
    echo "USAGE: `basename $0` <encrypted-file>" >&2
    exit 255
fi

cat $1 | age-decrypt.sh | $PAGER
