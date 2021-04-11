#!/bin/bash
input="tags.txt"
output="tags.css"
echo ".tag-house\+of\+leaves:after { content: none !important }" >> $output
while read -r line
do
  name="${line%%: *}"
  name="${name//[ -]/\\+}"
  name="${name//\'/\\%27}"
  name="${name//!/\\%21}"
  desc="${line#*: }"
  desc="${desc//\"/\\\"}"
  desc="${desc//./}"
  echo ".tag-$name:after { content: \"$desc\" !important }" >> $output
done < $input
