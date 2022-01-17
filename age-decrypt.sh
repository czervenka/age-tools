#!/bin/sh

PRIV_KEY=~/.age.key

if [ ! -f $PRIV_KEY ]; then

    echo "Missing age private key '$PRIV_KEY'. Generate one or update this script."
    exit 255
fi
age --decrypt -i ~/.age.key $*
