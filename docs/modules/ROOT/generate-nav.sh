#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"
readonly PARENT_DIR="/home/alanroth/workspace/payara-community-documentation"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

cd $WORKING_DIR

create_nav () {
    for file in "$1"/* ; do
        #Count the depth of the file
        depth=$(grep -o '/' <<< $file | grep -c .)
        stars=$(printf '%*s' $depth '')
        
        #Trim filepath for better readable titles
        filename=${file##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:$file[$filename]" >> $OUTPUT_NAV_LOCATION
        if [ -d "$file" ]; then
            create_nav "$file"
        fi
    done
}

for dir in */ ; do
    #Remove trailing / for easier formatting
    dir=${dir%?}
    #New line character required before heading for correct formatting
    echo >> $OUTPUT_NAV_LOCATION
    echo ".$dir" >> $OUTPUT_NAV_LOCATION
    create_nav "$dir"
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION