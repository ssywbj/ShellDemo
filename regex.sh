#!/bin/bash

result=`echo "abcd" | grep 'abc.'`
echo "match result: $result"
result=`echo "abc" | grep 'abc.'`
echo "match result: $result"
echo "abcdere" | grep --color 'abc.'
echo "abcdere" | grep --color "abc."

echo "ab" | grep --color '[abc]'
echo "ab" | grep --color '[acd]'

result=$(echo "hello xy" | grep --color '[^xy]')
echo "match result: $result"
echo "hello xy" | grep --color '[^xy]'
echo "hello world" | grep --color '[^xy]'
echo "he2324llo world" | grep --color '[0-9]'
result=`echo "hello world" | grep --color '[0-9]'`
echo "match result: $result"
echo "he343llo world" | grep --color '[a-z]'
echo "he343llo world" | grep --color '[[:digit:]]'
echo "he343llo world" | grep --color '[[:alpha:]]'

#匹配小数
echo "2.3" | grep -E --color '[0-9]?' #-E: 开启扩展(Extend)的正则表达式
echo "2.3" | grep -E --color '[0-9]?\.[0-9]?'
echo "2.93" | grep -E --color '[0-9]?\.[0-9]?'
echo "2x93" | grep -E --color '[0-9]?\.[0-9]?' #由于"."在正则中是一个特殊字符，所以需要转义字符转义，取出字面值
echo "2x93" | grep -E --color '[0-9]?.[0-9]?'
echo ".3" | grep -E --color '[0-9]?\.[0-9]'

echo "hello world" | grep -E --color 'he+'
echo "hllo world" | grep -E --color 'he+'
echo "heelo world" | grep -E --color 'he+'

echo "ooheeeeeelo world" | grep -E --color 'he*'

echo "--------------- {} ---------------"
echo "--------------- {n} ---------------"
echo "ooheeelo world" | grep -E --color 'he{4}'
echo "ooheeeelo world" | grep -E --color 'he{4}'
echo "ooheeeeelo world" | grep -E --color 'he{4}'
echo "--------------- {n,} ---------------"
echo "ooheeeelo world" | grep -E --color 'he{4,}'
echo "ooheeeeelo world" | grep -E --color 'he{4,}'
echo "--------------- {n,m} ---------------"
echo "ooheeeelo world" | grep -E --color 'he{1,3}'
echo "oohlo world" | grep -E --color 'he{1,3}'
echo "oohelo world" | grep -E --color 'he{1,3}'
echo "ooheelo world" | grep -E --color 'he{1,3}'
echo "ooheeelo world" | grep -E --color 'he{1,3}'
echo "oohlo world" | grep -E --color 'he{0,3}'


echo "--------------- ^ ---------------"
echo "hello world" | grep -E --color '^he'
echo "ello world" | grep -E --color '^he'
echo "hello world" | grep -E --color '^hello'

echo "--------------- $ ---------------"
echo "hello world" | grep -E --color 'ld$'
echo "hello world" | grep -E --color 'xld$'
echo "hello world" | grep -E --color 'rld$'
echo "hello world" | grep -E --color '\<wo'
echo "hello world" | grep -E --color 'llo\>'















