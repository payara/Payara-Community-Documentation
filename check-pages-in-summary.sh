#!/bin/bash

for f in `find -name '*.adoc'`
  do
    fx=`echo $f | sed 's!^./!!'`
    if ! grep "$fx" SUMMARY.adoc > /dev/null
        then
            echo ERROR: No link found for: "$fx"
    fi
done
