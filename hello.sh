#!/bin/bash

#"#!"：约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。Bash，"Bourne Again Shell"的简写，是大多数Linux 系统默认的Shell。
#一般情况下并不区分Bourne Shell和Bourne Again Shell，所以像"#!/bin/sh"，它同样也可以改为"#!/bin/bash"。

#"#"：单行注释符，注意的是sh里面没有多行注释符，多行注释只能一行行注释

#向窗口输出文本
echo "Hello World !"

#运行Shell脚本
#方式一：作为可执行程序
#cd到脚本所在目录：./xxx.sh
#如果没有权限执行，则先赋予权限：chmod a+x xxx.sh
#方式二：作为解释器参数
#这种方式是直接运行解释器，其参数就是shell脚本的文件名：
#sh xxx.sh或bash xxx.sh
#sh -x xxx.sh，-x：实现脚本语句的逐条跟踪

#定义变量
#1.只能使用英文字母、数字和下划线，首字符不能以数字开头；
#2.不能使用bash里的关键字（可用help命令查看保留关键字）。
country="China"
#引用变量，方式1：$var
echo "$country"
#引用变量，方式1：${var}，推荐这种方法
for skill in Ada Coffe Action Java; do #循环输出文本
    echo "I am good at ${skill} Script"
done

date

zip_name="wbj"
new_file="hello_bak.sh"
rm ${zip_name}.zip
cp hello.sh $new_file
zip $zip_name $new_file
echo "compressing..."
sleep 0.5
rm $new_file
echo "compress finish"
