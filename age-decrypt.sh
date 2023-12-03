#!/bin/sh

nick=$1
filename=$2

if [ "$nick" = "" ]; then
    echo "USAGE: `basename $0` <nick> [<filename>]

    If no filename is specified, opens a text editor to write a message to
    encrypt and prints the encrypted message to stdout.

    Otherwise, if <filename> is specified, encrypts the file creating <filename>.age encrypted file.
    " >&2
    exit 255
fi

if [ "$filename" = "" ]; then
    age-decrypt-text.sh $nick
else
    age-decrypt-dir.sh $nick $filename
fi
