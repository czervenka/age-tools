#!/bin/sh

PRIV_KEY=~/.age.key


pager_if_not_pipe() {
    [ "$PAGER" = "" ] && PAGER=less
    if [ -t 1 ]; then
        cat | $PAGER
    else
        cat
    fi
}

if [ ! -f $PRIV_KEY ]; then

    echo "Missing age private key '$PRIV_KEY'. Generate one or update this script." >&2
    exit 255
fi
if [ -t 0 ]; then
    tmp_msg_file=`mktemp`
    trap "rm $tmp_msg_file || true" EXIT
    $EDITOR $tmp_msg_file

    cat $tmp_msg_file | age --decrypt -i $key ~/.age.key $* | pager_if_not_pipe
else
    age --decrypt -i ~/.age.key $* | pager_if_not_pipe
fi
