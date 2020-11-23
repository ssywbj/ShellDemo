#!/bin/bash

result=`echo "abcd" | grep 'abc.'`
echo "match result: $result"
result=`echo "abc" | grep 'abc.'`
echo "match result: $result"
echo "abcdere" | grep --color 'abc.'

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
