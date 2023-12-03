#!/bin/sh

ME=`basename $0`

filename=$1
shift

nick=$1
shift

usage() {
    [ "$1" = "" ] || echo "Error: $*\n" >&2
    echo "USAGE: $ME <filename> <nick>" >&2
}

[ "$filename" = "" ] && usage "Missing file to encrypt." && exit 255
[ "$nick" = "" ] && usage "Missing nick to encrypt to." && exit 255
[ ! -f "$filename" ] && usage "File $filename does not exist." && exit 255

encryped_filename=${filename}.age
cat $filename | age-encrypt.sh $nick $* > $encryped_filename
echo "Encrypted file was stored to $encryped_filename."

