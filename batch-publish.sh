#!/usr/bin/env bash
for dir in */; do
    cd "$dir" || exit;
    dart pub publish
    cd ..;
done;