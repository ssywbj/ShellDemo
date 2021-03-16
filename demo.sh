#!/bin/bash

if echo "Hello World !" | grep -e 'Hello'; then
   echo "匹配到了"
else
   echo "没有匹配到"
fi

if echo "Hello World !" | grep -e 'Bar'; then
   echo "匹配到了"
else
   echo "没有匹配到"
fi

pattern=$(echo "Hello World !" | grep 'Hello')
if [ $? == 0 ]; then
   echo "匹配到了"
else
   echo "没有匹配到"
fi
echo "pattern: $pattern"
if [ "$pattern" ]; then #　$var需要用""引起来
   echo "匹配到了"
else
   echo "没有匹配到"
fi

pattern=$(echo "Hello World !" | grep 'Bar')
if [ $? == 0 ]; then
   echo "匹配到了"
else
   echo "没有匹配到"
fi
echo "pattern: $pattern"
if [ "$pattern" ]
then
   echo "匹配到了"
else
   echo "没有匹配到"
fi

function makeQuotMod() {
  add=$1
  shift=$2
  quot=$((add / shift))          #商数
  mod=$((add % shift))           #余数

  read -ra array <<<"$quot $mod" #返回数组，第一数是商，第二个数是余数
  echo "${array[*]}"
}
read -ra array <<<"$(makeQuotMod 31 26)"
echo "quot: ${array[0]}, mod: ${array[1]}"

function modifyVersionName() {
  readonly version=1.0.0.bc
  readonly version_str=${version//./}      #1.0.0.a->100a
  version_rev=$(echo "$version_str" | rev) #rev：字符反转
  version_rev_sed=$(echo "$version_rev" | sed 's/\(.\)\(.\)\(.\)\(.\)/\1\2.\3.\4./')
  version_rev_sed_rep=${version_rev//00/45}
  echo "version_str: $version_str, version_rev: $version_rev, version_rev_sed: $version_rev_sed
  , version_rev_sed_rep: $version_rev_sed_rep"
}
modifyVersionName
