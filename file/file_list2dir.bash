#!/bin/bash -eu

file="${1:-}"

if [[ ! "$file" ]]; then usage; exist 1; fi

ARG0=${BASH_SOURCE[0]}
FILE_PATH=$(readlink -f $ARG0)
FILE_DIR=$(dirname $FILE_PATH)
FILE_NAME=$(basename $FILE_PATH)

func_count2reduce(){
    local v="${1?missing}"; local cmd="${2?missing}"; local n=${3?missing};
    for ((i=0;i<$n;i++)); do v=$($cmd $v) ; done; echo "$v"
}

REPO_DIR=$(func_count2reduce $FILE_DIR dirname 4)

errcho(){ >&2 echo $@; }

cat $file | while read line
do
    cp "/home/kycho/data/pdf/$line" "/home/kycho/pdf2text/"
done
