#!/bin/bash

format_tags () {
    IFS=';' read -ra TAGS <<< "$1"
    local tags_str
    for tag in "${TAGS[@]}"; do
      tags_str=$tags_str\"$tag\",
    done
    tags_str=${tags_str%,}
    echo $tags_str
}

i=1
docs=""
while IFS=, read -r title tags url
do
    formatted_tags=$(format_tags $tags)
    docs=$docs{\"id\":\"$i\",\"title\":\"$title\",\"tags\":[$formatted_tags],\"url\":\"$url\"},
    ((i=i+1))
done < example-data.txt

json=${docs%,}
json="[$json]"

curl http://localhost:8983/solr/chainguide/update -d $json
