#!/usr/bin/env bash

str='http://i-ts.russeas.ru/req.shtml?param1=val1&param2=val2'

count=100
read count

for (( x = 3; x <= count; x++ ))
do
	str="$str&param$x=val$x"
done

echo $str

