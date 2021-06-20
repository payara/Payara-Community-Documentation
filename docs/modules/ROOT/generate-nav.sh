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
            ext="${file##*.}"
            #We only want to process Asciidoc files, ignore other files.
            if [[ $ext == "adoc" ]]; then
                ordinal_list[$file]=$(get_ordinal "$file")
                #read -p "Press Any Key"
            fi
        else
            create_nav "$file"
        fi
    done
}

write_to_nav() {
    for sorted_file in "${sorted_list[@]}"; do
        path_step=""
        path_index=0
        #We need to write each part of path on each line
        #Cut the first part of the path as that is a duplication
        for path in $(tr / " " <<< $sorted_file); do
            ((path_index++))
            path_step+=$path"/"

            #depth=$(grep -o '/' <<< $path_step | grep -c .)
            stars=$(printf "%"$path_index"s")

            filename=${path##*/}
            filename=${filename%.adoc}

            echo "${stars// /*} xref:$path_step[$filename]" >> $OUTPUT_NAV_LOCATION
        done
    done
}

write_to_nav_2() {
    path_index=0
    for sorted_file in "${sorted_list[@]}"; do
        #((path_index++))

        depth=$(grep -o '/' <<< $sorted_file | grep -c .)
        stars=$(printf "%"$depth"s")

        filename=${sorted_file##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:$sorted_file[$filename]" >> $OUTPUT_NAV_LOCATION
    done
}

sort_list() {
    KEYS=$(
        for KEY in ${!ordinal_list[@]}; do
            echo "${ordinal_list[$KEY]}:::$KEY"
        done | sort -r | awk -F::: '{print $2}')
        
    for KEY in $KEYS; do
        #sorted_list+=( $(echo $KEY | cut -d '/' -f 1 --complement) )
        sorted_list+=($KEY)
    done
}

get_ordinal() {
    content=$(cat "$1")
    if [[ -z $content ]]; then 
        echo 0
    fi

    regex=":ordinal: ([[:digit:]]+)"
    if [[ $content =~ $regex ]]; then
        echo ${BASH_REMATCH[1]}
    else
        echo 0
    fi
}

for dir in */ ; do
    dir=${dir%?}
    if [[ $dir == "FolderTest" || $dir == "Appendix" || $dir == "Test" || $dir == "Security" ]]; then
        #Remove trailing / for easier formatting
        #New line character required before heading for correct formatting
        echo >> $OUTPUT_NAV_LOCATION
        echo ".$dir" >> $OUTPUT_NAV_LOCATION
        create_nav "$dir"
        sort_list
        write_to_nav_2
        ordinal_list=()
        sorted_list=()
    fi
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION