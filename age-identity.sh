#!/bin/sh

if [ "$1" = "" ]; then
    echo "USAGE: `basename $0` <nick>|<pubkey>

          Prints information about identity with nick or pubkey.
    " >&2
    exit 255
fi

cat ~/.age-identities | grep $1 2> /dev/null || echo "The nick/pubkey '${1}' was not added yet."
