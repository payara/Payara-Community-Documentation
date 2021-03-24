#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav-new.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

cd $WORKING_DIR

create_nav () {
    for file in "$1"/* ; do
        if [ ! -d $file ]; then
            #Count the depth of the file
            depth=$(grep -o '/' <<< $file | grep -c .)
            stars=$(printf '%*s' $depth '')
            filename=${file##*/}
            filename=${filename%.*}
            echo "${stars// /*} xref:$file[$filename]" >> $OUTPUT_NAV_LOCATION
        else
            create_nav $file
        fi
    done
}

for dir in */ ; do
    #Remove trailing / for easier formatting
    dir=${dir%?}
    echo ".$dir" >> $OUTPUT_NAV_LOCATION
    create_nav $dir
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION