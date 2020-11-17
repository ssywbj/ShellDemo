#!/bin/bash

:<<EOF
zip_name="wbj"
src_file="syntax.sh"
new_file="syntax_bak.sh"
rm ${zip_name}.zip
cp $src_file $new_file
echo compressing...
zip $zip_name $new_file
rm $new_file
echo compress finish
EOF

git add .
git commit -m "$1"
git push origin main
