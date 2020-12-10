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

#----------------- 编译打包 -----------------
readonly module_dir=$(pwd | awk -F "/" '{print $NF}')
echo "module: $module_dir"
./../../gradlew :watchface":${module_dir}":aR
#echo "result: $?"

#if [ $? -eq 0 ]; then
#    echo "apk打包成功，程序继续执行"
#else
#    echo "apk打包失败，脚本退出执行！"
#    exit
#fi

# shellcheck disable=SC2181
if [ $? -ne 0 ]
then
    echo "apk打包失败，脚本退出执行！"
    exit
fi

#if ! make mytarget;
#then
#    echo "apk打包失败，脚本退出执行！"
#    exit
#fi

#readonly home_pkg="com.wiz.watch.home.home"
#adb shell pm clear $home_pkg
#echo "result: $?"
#adb shell am start "$home_pkg/.ui.AppListActivity"
#echo "result: $?"
