#!/bin/bash

AGE_IDENTITIES=~/.age-identities

nick=$1
pubkey=$2

usage() {
    echo "USAGE: `basename $0` <nick> <pubkey>

    Associates <identity> with <nick>.
    " >&2
}

identity_exists() {
    cat $AGE_IDENTITIES | grep -E "^$nick" > /dev/null
}


if [ -z $pubkey ]; then
    usage
    exit 255
fi

if identity_exists $nick; then
    echo "Identity exists" >&2
    exit 1
else
    echo "$nick $pubkey" >> $AGE_IDENTITIES
    echo "Identity key '$pubkey' was associated with nick '$nick'." >&2
fi

