#!/bin/bash

identity=$1
shift
src_dir=$1
shift

if [ -z $src_dir ]; then
    echo "USAGE: `basename $1` <identity> <directory>"
fi

tar czv $src_dir | age-encrypt.sh $identity $* > src_dir.tar.gz.age
