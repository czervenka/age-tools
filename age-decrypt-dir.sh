#!/bin/sh

ME=`basename $0`

filename=$1
shift

usage() {
    [ "$1" = "" ] || echo "Error: $*\n" >&2
    echo "
    USAGE: $ME <encrypted-file>

    Decrypts <encrypted-file> which was encrypted by age-encrypt.sh
    " >&2
}

[ "$filename" = "" ] && usage "Missing file to decrypt." && exit 255
[ ! -f "$filename" ] && usage "File $filename does not exist." && exit 255

cat $filename | age-decrypt-text.sh $* | tar x

