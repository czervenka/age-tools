#!/bin/sh

IDENTITIES_FILE=~/.age-identities

ME=`basename $0`

nick=$1
shift

usage() {
    echo "
USAGE:
    $ME <nick>
    or 
    echo \"secret message\" | $ME <nick>


    Encrypts any text with your private key at ~/.age.key and sends the encrypted output to stdout.
    " >&2
}


if [ -z $nick ]; then
    echo "ERROR: Missing nick\n" >&2
    usage
    exit 255
fi

if [ ! -f $IDENTITIES_FILE ]; then
    echo "There is not identities file '$IDENTITIES_FILE'. Please create the file with content:

    $IDENTITIES_FILE:
    -----
    <nickname> <key>
    <inckname> <key>
    -----
    "
fi

nick_to_key() {
    cat ~/.age-identities | grep -E "^$nick " | awk '{print $2}'
}

key=`nick_to_key $nick`
if [ -z $key ]; then
    echo -e "There is no key for user $nick." >&2
    exit 1
fi

if [ -t 0 ]; then
    tmp_msg_file=`mktemp`
    trap "rm $tmp_msg_file || true" EXIT
    $EDITOR $tmp_msg_file

    cat $tmp_msg_file | age --encrypt -r $key --armor -o - $*
else
    age --encrypt -r $key --armor -o - $*
fi
