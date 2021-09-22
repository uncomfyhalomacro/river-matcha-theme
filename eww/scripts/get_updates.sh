#!/bin/sh

update=$(zypper lu | tail -n +5 | wc -l)
if [ $update == "0" ]; then
    echo "Up-to-date"
else
    echo "Updates:$update"
fi
