#!/bin/bash

ME=$0

identity=$1
shift
src=$1
shift

if [ -z $src ]; then
    echo "USAGE: `basename $ME` <identity> <directory>" >&2
    exit 255
fi

echo "Encrypting ..." >&2
echo "--------------"

tar czv $src | age-encrypt.sh $identity $* > ${src}.age
echo "--------------"
echo
echo "Encrypted message saved as ${src}.age."
echo "
To decrypt run:

      age-decrypt.sh ${src}.age
"
