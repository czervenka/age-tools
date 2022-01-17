#!/bin/sh

# USAGE:
# Create file $HOME/.age-identities with content
# <nickname> <public-key>
#
# After that encrypt message by typping
# echo "somemessage" | age-encrypt <nickname>

IDENTITIES_FILE=~/.age-identities

username=$1
shift

if [ -z $username ]; then
    echo "Missing username\n\nUsage: echo \"message\" | $(basename $0) <nickname> > encrypted-messge.age"
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

username_to_key() {
    cat ~/.age-identities | grep -E "^$username " | awk '{print $2}'
}

key=`username_to_key $username`
if [ -z $key ]; then
    echo -e "There is no key for user $username."
    exit 1
fi
age --encrypt -r $key --armor -o - $*
