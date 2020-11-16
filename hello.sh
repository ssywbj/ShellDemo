#!/bin/bash

#"#!"：约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。Bash，"Bourne Again Shell"的简写，是大多数Linux 系统默认的Shell。
#一般情况下并不区分Bourne Shell和Bourne Again Shell，所以像"#!/bin/sh"，它同样也可以改为"#!/bin/bash"。

#"#"：单行注释符，注意的是sh里面没有多行注释符，多行注释只能一行行注释

#向窗口输出文本
echo "Hello World !" #加双引号
echo Hello World ! #不加双引号

#运行Shell脚本
#方式一：作为可执行程序
#cd到脚本所在目录：./xxx.sh
#如果没有权限执行，则先赋予权限：chmod a+x xxx.sh
#方式二：作为解释器参数
#这种方式是直接运行解释器，其参数就是shell脚本的文件名：
#sh xxx.sh或bash xxx.sh
#sh -x xxx.sh，-x：实现脚本语句的逐条跟踪

#定义变量
#1.只能使用英文字母、数字和下划线，首字符不能以数字开头
#2.不能使用bash里的关键字（可用help命令查看保留关键字）
#3.等号两侧不能留有空格
country="China"
#引用变量，方式1：$var
echo $country
#引用变量，方式2：${var}，推荐这种方法
echo ${country}
#改变变量的值
country="USA"
echo ${country}
#readonly定义只可读的变量，不能改变其值
readonly ronly="real only"
#readonly ronly
echo $ronly
ronly="change" #若尝试更改只读变量的值，结果将报错
echo $ronly

#字符串
#shell编程中最常用最有用的数据类型，字符串可以用单引号，
#也可以用双引号，也可以不用引号。
#单引号
str='this is a string'
echo $str;
#使用单引号的限制
#1.单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
#2.单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），
#但可成对出现，作为字符串拼接使用。
your_name='runoob'
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2
echo $greeting_3
#双引号
str="Hello, I know you are \"$your_name\"! \n"
echo -e $str #参数e配合换行符"\n"的使用，可以向窗口输出一个换行
#使用双引号的优点 1.双引号里可以有变量；2.可以出现转义字符。
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo -e $greeting  $greeting_1 "\n" #可以连续输出变量
echo 获取字符串的长度: ${#str}
echo 提取子字符串: ${str:1:4}
echo 查找子字符串位置
string="runoob is a great site"
echo `expr index "$string" i` #输出8，查找字符i的位置(第一次出现)
echo `expr index "$string" io` #输出4，查找字符i或o的位置(哪个字母先出现就计算哪个)

for skill in Ada Coffe Action Java; do #循环输出文本
    echo "I am good at ${skill} Script"
done

date

#zip_name="wbj"
#new_file="hello_bak.sh"
#rm ${zip_name}.zip
#cp hello.sh $new_file
#zip $zip_name $new_file
#echo "compressing..."
#sleep 0.5
#rm $new_file
#echo "compress finish"

