#!/bin/bash
input="tags.txt"
output="tags.css"
echo -n ".tag-house\\%20of\\%20leaves:after{content:none!important}" > $output
while read -r line
do
  name="${line%%: *}"
  name="${name//[ -]/\\%20}"
  name="${name//\'/\\%27}"
  name="${name//!/\\%21}"
  desc="${line#*: }"
  desc="${desc//\"/\\\"}"
  desc="${desc//./}"
  echo -n ".tag-$name:after{content:\"$desc\"!important}" >> $output
done < $input
