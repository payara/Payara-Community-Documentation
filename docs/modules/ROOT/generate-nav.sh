#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"
readonly PARENT_DIR="/home/alanroth/workspace/payara-community-documentation"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

cd $WORKING_DIR

create_nav () {
    echo $1
    for file in "$1"/* ; do
        declare -A ordinal_list

        depth=$(grep -o '/' <<< $file | grep -c .)
        stars=$(printf '%*s' $depth '')

        filename=${file##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:$file[$filename]" >> $OUTPUT_NAV_LOCATION
        if [[ ! -d "$file" ]]; then
            ordinal_list[$filename]=$(get_ordinal "$file")
        else
            create_nav "$file"
        fi
    done
    
    for K in "${!ordinal_list[@]}"; do echo $K "->" ${ordinal_list[$K]}; done
    read -p "Press Any Key"
}

sort() {
    echo "TODO"
}

get_ordinal() {
    content=$(cat "$1")
    regex=":ordinal: ([[:digit:]]+)"
    if [[ $content =~ $regex ]]; then
        echo ${BASH_REMATCH[1]}
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
#cat $OUTPUT_NAV_LOCATION