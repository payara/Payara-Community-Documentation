#!/bin/bash

readonly WORKING_DIR="$(pwd)/pages"
readonly NEW_NAV_FILE_NAME="nav.adoc"
readonly OUTPUT_NAV_LOCATION="$(pwd)/$NEW_NAV_FILE_NAME"
readonly PARENT_DIR="/home/alanroth/workspace/payara-community-documentation"

rm $OUTPUT_NAV_LOCATION
touch $OUTPUT_NAV_LOCATION

dirs=()
sorted_files=()

cd $WORKING_DIR

write_to_nav() {
    readarray -t dirs < <(find . -type d -printf '%P\n')

    for dir in "${dirs[@]}"; do
        readarray -t files_to_sort < <(find "$dir" -maxdepth 1 -type f)
        if [[ ${#dirs[@]} -eq 1 ]]; then
            readarray -t files_to_sort < <(find * -maxdepth 1 -type f)
        fi
        
        #Add parent folder to root of the path
        dir="${1}/$dir"

        depth=$(grep -o '/' <<< $dir | grep -c .)
        stars=$(printf "%"$depth"s")

        filename=${dir##*/}
        filename=${filename%.adoc}

        echo "${stars// /*} xref:${dir}[${filename}]" >> $OUTPUT_NAV_LOCATION

        if [[ ${#files_to_sort[@]} -ne 0 ]]; then
            sort_files "$dir"
            for file in "${sorted_files[@]}"; do
                file="$1/$file"

                depth=$(grep -o '/' <<< $file | grep -c .)
                stars=$(printf "%"$depth"s")

                filename=${file##*/}
                filename=${filename%.adoc}

                echo "${stars// /*} xref:${file}[${filename}]" >> $OUTPUT_NAV_LOCATION
            done
        fi
    done
}

sort_files() {
    ordinal_list=()
    #files_to_sort=$1

    for file in "${files_to_sort[@]}"; do
        ordinal_list+=("$(get_ordinal "$file"):::$file")
    done

    #We want to delimit based on new line, not the default space
    SAVEDIFS=$IFS
    IFS=$'\n'
    sorted_files=($(
        for KEY in "${ordinal_list[@]}"; do
            echo "$KEY"
        done | sort -r | awk -F::: '{print $2}'
    ))
    IFS=$SAVEDIFS
}

get_depth() {

}

get_filename() {
    
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
    #if [[ $dir == "Test" || $dir == "FolderTest" ]]; then
    cd "${dir}"
    echo >> $OUTPUT_NAV_LOCATION
    echo ".$dir" >> $OUTPUT_NAV_LOCATION
    write_to_nav "$dir"
    cd $WORKING_DIR
    #fi
done

echo "---- GENERATED NAV -----"
cat $OUTPUT_NAV_LOCATION