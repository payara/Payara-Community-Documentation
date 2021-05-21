#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"
readonly PARENT_DIR="/home/alanroth/workspace/payara-community-documentation"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

declare -A ordinal_list
sorted_list=()

cd $WORKING_DIR

create_nav () {
    for file in "$1"/* ; do
        if [[ ! -d "$file" ]]; then
            ordinal_list[$file]=$(get_ordinal "$file")
        else
            create_nav "$file"
        fi
    done
    
    sort_list
    echo "SORTED LIST: " $sorted_list[@]

    for sorted_file in "${sorted_list[@]}"; do
        echo "SORTED FILE:" $sorted_file
        read -p "Press Any Key"

        depth=$(grep -o '/' <<< $sorted_file | grep -c .)
        stars=$(printf '%*s' $depth '')

        filename=${sorted_file##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:$sorted_file[$filename]" >> $OUTPUT_NAV_LOCATION
    done
}

sort_list() {
    sorted_list=()
    KEYS=$(
        for KEY in ${!ordinal_list[@]}; do
            echo "${ordinal_list[$KEY]}:::$KEY"
        done | sort -r | awk -F::: '{print $2}'
    )

    echo "KEYS:" $KEYS[@]

    for KEY in $KEYS; do
        sorted_list+=( $KEY )
    done
}

get_ordinal() {
    content=$(cat "$1")
    regex=":ordinal: ([[:digit:]]+)"
    if [[ $content =~ $regex ]]; then
        echo ${BASH_REMATCH[1]}
    else
        echo 0
    fi
}

for dir in */ ; do
    echo $dir
    dir=${dir%?}
    if [[ $dir == "Test" ]]; then
        #Remove trailing / for easier formatting
        #New line character required before heading for correct formatting
        echo >> $OUTPUT_NAV_LOCATION
        echo ".$dir" >> $OUTPUT_NAV_LOCATION
        create_nav "$dir"
    fi
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION