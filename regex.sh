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
