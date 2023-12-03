#!/bin/sh

ME=`basename $0`

filename=$1
shift

usage() {
    [ "$1" = "" ] || echo "Error: $*\n" >&2
    echo "USAGE: $ME <filename>" >&2
}

[ "$filename" = "" ] && usage "Missing file to encrypt." && exit 255
[ ! -f "$filename" ] && usage "File $filename does not exist." && exit 255

decrypted_filename=${filename%%.age}
if [ "$decrypted_filename" = "$filename" ]; then
    decrypted_filename=${filename}-decrypted
fi

if [ -f "$decrypted_filename" ]; then
    echo "Error: A decrypted file already exists."
    exit 1
fi
cat $filename | age-decrypt.sh $* > $decrypted_filename
echo "File was decrypted to $decrypted_filename."

