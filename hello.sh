#!/bin/bash
date
echo "Hello World !"
mkdir Tmp
#ls -lh ../Android

country="China"
echo "$country"

for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill} Script"
done

zip_name="wbj"
new_file_name="hello_bak.sh"
rm ${zip_name}.zip
cp hello.sh $new_file_name
zip $zip_name $new_file_name  
echo "compressing..."
sleep 0.5
echo "compress finish"
