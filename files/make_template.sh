#!/bin/bash

file_conf=$1
role=$2
file_templ=$3
file_init='manifests/init.pp'

[ -f "$file_init" ] || exit 2
cp $file_conf $file_templ || exit 3

sed -n '/(/,/)/ {/(/d; /)/d; p}' $file_init | grep "\$$role" | awk '{print $1}' \
| while read opt; do 
  opt_c=`echo $opt | sed "s/\\\$${role}_//"`
  opt_t=`echo $opt | sed 's/\\$/@/'`
  echo "$opt_t -> $opt_c"
  sed -i "s/^\(#$opt_c:.*\)/<% if $opt_t -%>\n$opt_c: <%= $opt_t %>\n<% else -%>\n\1\n<% end -%>/" $file_templ
done

