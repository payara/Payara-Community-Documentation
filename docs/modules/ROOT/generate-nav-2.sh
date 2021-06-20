#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"
readonly PARENT_DIR="/home/alanroth/workspace/payara-community-documentation"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

dirs=()
sorted_dirs=()

cd $WORKING_DIR

write_to_nav() {
    readarray -t dirs < <(find . -printf '%P\n')

    sort_dirs "$1"

    for dir in "${sorted_dirs[@]}"; do
        #Add parent folder to root of the path
        dir="${1}/$dir"

        depth=$(grep -o '/' <<< $dir | grep -c .)
        stars=$(printf "%"$depth"s")

        filename=${dir##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:${dir}[${filename}]" >> $OUTPUT_NAV_LOCATION
    done
}

sort_dirs() {
    ordinal_list=()

    for file in "${dirs[@]:1}"; do
        ordinal_list+=("$(get_ordinal "$1/$file"):::$file")
    done

    #We want to delimit based on new line, not the default space
    SAVEDIFS=$IFS
    IFS=$'\n'
    sorted_dirs=($(
        for KEY in "${ordinal_list[@]}"; do
            echo "$KEY"
        done | sort -r | awk -F::: '{print $2}'
    ))
    IFS=$SAVEDIFS
}

get_ordinal() {
    if [[ ! -f $1 ]]; then
        echo 0
        return
    fi
    content=$(cat "$1")

    regex=":ordinal: ([[:digit:]]+)"
    if [[ $content =~ $regex ]]; then
        echo ${BASH_REMATCH[1]}
    else
        echo 0
    fi
}

for dir in */ ; do
    dir=${dir%?}
    if [[ $dir == "FolderTest" ]]; then
        cd "${dir}"
        echo >> $OUTPUT_NAV_LOCATION
        echo ".$dir" >> $OUTPUT_NAV_LOCATION
        write_to_nav "$dir"
        cd $WORKING_DIR
    fi
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION