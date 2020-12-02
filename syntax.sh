#!/bin/bash

#"#!"：约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。Bash，"Bourne Again Shell"的简写，是大多数Linux 系统默认的Shell。
#一般情况下并不区分Bourne Shell和Bourne Again Shell，所以像"#!/bin/sh"，它同样也可以改为"#!/bin/bash"。

#"#"：单行注释符

echo "------------ echo start --------------" 
#向窗口输出文本
echo "Hello World !" #加双引号
echo Hello World ! #不加双引号
#参数e配合换行符"\n"的使用，可以向窗口输出一个换行
echo -e "---------- echo end ------------\n" 

#运行Shell脚本
#方式一：作为可执行程序
#cd到脚本所在目录：./xxx.sh
#如果没有权限执行，则先赋予权限：chmod a+x xxx.sh
#方式二：作为解释器参数
#这种方式是直接运行解释器，其参数就是shell脚本的文件名：
#sh xxx.sh或bash xxx.sh
#sh -x xxx.sh，-x：实现脚本语句的逐条跟踪

echo "----------- 定义变量 start ------------\n" 
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
echo -e "---------- 定义变量 end ------------\n" 

echo "------------ 字符串 start ------------\n" 
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
str="Hello, I know you are \"$your_name\"!"
echo $str
#使用双引号的优点 1.双引号里可以有变量；2.可以出现转义字符。
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo -e $greeting  $greeting_1"\n" #可以连续输出变量
str="Hello, Daliy"
echo \"${str}\"的长度: ${#str}
echo 提取\"${str}\"的子字符串: ${str:1:5}
source_string="runoob is a great site"
echo 在\"${source_string}\"查找字符\'i\'位置
echo `expr index "$source_string" i` #输出8，查找字符i的位置(第一次出现)，“``”是反单引号，不是单引号“‘”
echo 在\"${source_string}\"查找字符\'i\'或\'r\'位置
echo `expr index "$source_string" ir` #输出1，查找字符i或o的位置(哪个字母先出现就计算哪个)
echo -e "---------------- 字符串 end -----------------\n"

echo ---------------- 数组 start -----------------
#Bash Shell只支持一维数组（不支持多维数组），并且没有限定数组的大小
array_name=(a bb ccc dddd) #数组定义
echo ${array_name[@]} #获取数组全部元素
echo ${array_name[1]} #获取数组单个元素
echo 数组的长度：${#array_name[*]} #获取数组的长度方式1
echo 单个元素的长度：${#array_name[2]}
array_name2=(
a 
bb
ccc
dddd
"eeeee"
) #数组定义
echo ${array_name2[@]}
readonly length=${#array_name2[@]}
echo 数组的长度：$length #获取数组的长度方式2
echo -e ---------------- 数组 end -----------------"\n"

#多行注释方式1
:<<EOF
for skill in Ada Coffe Action Java; do #循环输出文本
    echo "I am good at ${skill} Script"
done
EOF
#多行注释方式2
:<<!
for skill in Ada Coffe Action Java; do #循环输出文本
    echo "I am good at ${skill} Script"
done
!

echo  ---------------- 传递参数 start -----------------
echo "第一个参数：$1"
echo "第二个参数：$2"
#./syntax.sh "dfahsh fgsfs" 传递一个参数：dfahsh fgsfs
#./syntax.sh dfahsh fgsfs 传递两个参数：dfahsh和fgsfs (带引号与不带引号的差别)
#一些特殊字符用来处理
echo "$"#"参数个数：$#"
echo "$"0"执行的文件名（包含文件路径）：$0"
echo "$"*"以一个单字符串显示所有向脚本传递的参数：$*"
echo "$"@"与$"*"相同，但是使用时加引号，并在引号中返回每个参数：$@"

echo "$"*"与$"@"的不同"
echo "$"*"输出："
for i in "$*"; do
    echo $i
done
echo "$"@"输出："
for i in "$@"; do
    echo $i
done

echo -e ---------------- 传递参数 end -----------------"\n"

echo  ---------------- 运算符 start -----------------
#原生bash不支持算术运算，但是可以通过其他命令来实现，如bc、awk、expr等，其中expr只支持整数间的运算，bc和awk支持小数运算。

#expr命令
#expr 13 + 17 注意：各加数之前要用空格分开
#bc命令
#echo "1.3+1.7"|bc
#awk命令
#awk 'BEGIN{print 2.6+34}'

#expr运用
echo "------ expr计算 ------"
sum=`expr 12 + 23` #注意：“``”是反引号，不是引号
echo "12 + 23 = $sum"
n1=23
n2=17
sum=`expr $n1 + $n2`
echo $n1 + $n2 = $sum
val=`expr $n1 \* $n2` #注意“*”需要转义
echo "$n1 * $n2 : $val"
#expr语句可简写为$((表达式))
val=$((n1 * n2)) #这里“*”不需要转义
echo "$n1 * $n2 : $val"

echo "------ bc计算 ------"
sum=`echo "23.1+0.9" | bc`
echo "23.1+0.9=$sum"
var1=12.3
var2=2.35
sum=`echo "$var1 + $var2" | bc`
:<<EOF
若变量值的前后出现空格、不可打印字符，可能会报下面的语法错误
(standard_in) 1: illegal character: ^
(standard_in) 1: illegal character: ^?
EOF
echo "$var1+$var2=$sum"
val=$(echo "$var1 * $var2" | bc) #反引号``可用$()替代
echo "$var1*$var2=$val"
val=$(echo "scale=3;$var1 * $var2" | bc) #保留两位小数
echo "$var1*$var2=$val"
calc_str="(34.05+21.4)*2"
val=$(echo $calc_str | bc)
echo "calc result: $val"

echo "------ awk计算 ------"
sum=$(awk 'BEGIN{print 12.3+3.5}')
echo "12.3+3.5=$sum"
sum=$(awk 'BEGIN{print '$n1'+'$n2'}')
echo "$n1+$n2=$sum"
val=`awk 'BEGIN{print '$var1'*'$var2'}'`
echo "$var1*$var2=$val"
val=$(awk 'BEGIN{print '$calc_str'}')
echo "calc result: $val"

echo "------ 条件运算 ------"
#1.if和[]之间要有空格分开；2.条件表达式放在[]之间，两侧要有空格
#3.运算符与两侧的变得也需要用空格分开
if [ $n1 != $n2 ] #if...then...fi：条件语句
then
echo "$n1 != $n2"
fi
n3=17
if [ $n3 == $n2 ];then #then也可以写在这
echo "$n3 == $n2"
fi

echo "---------- 关系运算符 -----------
#关系运算符只支持数字，不支持字符串，除非字符串的值是数字"
n1=10
n2=20
n3=20
if [ $n3 -eq $n2 ];then
echo "$n3 == $n2"
fi

if [ $n1 -ne $n2 ];then
echo "$n1 != $n2"
fi

if [ $n1 -gt $n2 ];then
echo "$n1 大于$n2"
else
echo "$n1 小于 $n2"
fi

:<<EOF
-eq	检测两个数是否相等，相等返回true
-ne	检测两个数是否不相等，不相等返回true
-gt	检测左边的数是否大于右边的，如果是，则返回true
-lt	检测左边的数是否小于右边的，如果是，则返回true
-ge	检测左边的数是否大于等于右边的，如果是，则返回true
-le	检测左边的数是否小于等于右边的，如果是，则返回true
EOF

echo "---------- 布尔、逻辑运算符 -----------"
:<<!
-o 或运算，有一个表达式为true 则返回true
-a 与运算，两个表达式都为true 才返回true
! 非运算，表达式为true则返回false，否则返回true
!
if [ $n1 -gt $n2 -o $n1 -lt 11 ];then
echo "${n1}小于${n2}，也小于11"
fi
if [ $n1 -gt $n2 -a $n1 -lt 11 ];then
echo "${n1}小于${n2}，也小于11"
else
echo "所有条件为true，才为true"
fi
if [ ! $n1 -gt $n2 -a $n1 -lt 11 ];then
echo "取反，${n1}小于${n2}，也小于11"
else
echo "所有条件为true，才为true"
fi
if [ $n1 -lt $n2 -o $n1 -lt 11 ];then
echo "${n1}小于${n2}，也小于11"
fi
#使用||、&&
a=10
b=20
if [[ $a -lt 100 && $b -gt 100 ]] #注意是两个[]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

echo "--------- 字符串运算符 -----------"
:<<!
= 检测两个字符串是否相等，相等返回true
!= 检测两个字符串是否相等，不相等返回true
-z 检测字符串长度是否为0，为0返回true
-n 检测字符串长度是否不为0，不为0返回true
$ 检测字符串是否为空，不为空返回true
!
a="abc"
b="efg"
if [ $a = $b ]
then
echo "$a = $b : a 等于 b"
else
echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
echo "$a != $b : a 不等于 b"
else
echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
echo "-z $a : 字符串长度为 0"
else
echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
echo "-n $a : 字符串长度不为 0"
else
echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
echo "$a : 字符串不为空"
else
echo "$a : 字符串为空"
fi

echo "--------- 文件测试运算符 ---------"
:<<!
-d file检测文件是否是目录，如果是，则返回true
-f file检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回true
-r file检测文件是否可读，如果是，则返回true
-w file检测文件是否可写，如果是，则返回true
-x file检测文件是否可执行，如果是，则返回true
-s file检测文件是否为空（文件大小是否大于0），不为空返回true
-e file检测文件（包括目录）是否存在，如果是，则返回true
!
file="./apply.sh"
file="./aa"
file="empty.txt"
if [ -r $file ]
then
echo "文件可读"
else
echo "文件不可读"
fi
if [ -w $file ]
then
echo "文件可写"
else
echo "文件不可写"
fi
if [ -x $file ]
then
echo "文件可执行"
else
echo "文件不可执行"
fi
if [ -f $file ]
then
echo "文件为普通文件"
else
echo "文件为特殊文件"
fi
if [ -d $file ]
then
echo "文件是个目录"
else
echo "文件不是个目录"
fi
if [ -s $file ]
then
echo "文件不为空"
else
echo "文件为空"
fi
if [ -e $file ]
then
echo "文件存在"
else
echo "文件不存在"
fi
echo -e ---------------- 运算符 end -----------------"\n"

echo -e ---------------- 流程控制 start -----------------
#sh的流程控制不可为空，如若else分支没有语句执行，就不要写else
#以fi结尾（fi就是if倒过来拼写）

#if语句也可以写成一行（适用于终端命令提示符），如：
if [ $(ps -ef | grep -c "ssh") -gt 0 ];then echo "more than zero";fi

#if..else if..else语句
int=1
if [ $int -lt 0 ]
then
echo "less than 0"
elif [ $int -eq 1 ]
then
echo "they equals"
else
echo "nothing match"
fi

#for循环
for var in 11 12 13 14 15
do
echo "for value: $var"
echo "for value + 1: $(($var+1))"
done
echo ----- for循环写成一行 --------
for var in 11 12 13 14 15;do echo "for value: $var";echo "for value + 1:$(($var+1))";done;
for str in 'I Love You'
do
echo "for str value: $str"
done
for str in "I Love You, too"
do
echo "for str value: $str"
done
for str in I Love You, too
do
echo "for str value: $str"
done
echo ----- 循环输出数组的值-----
for var in ${array_name[@]};do echo "array value: $var";done

echo ----- while循环-----
#while循环
count=1
while(($count <= 5))
do
echo "count: $count"
let count++ #让变量进行算术运算，let可以用(())代替
#((count++))
done




echo -e ---------------- 流程控制 end -----------------"\n"

date






