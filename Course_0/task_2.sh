#/usr/bin/env bash

#Напишите скрипт на bash, который ожидает ввода с клавиатуры один
#аргумент (целое число от 0 до бесконечности), который будет
#обозначать число студентов в аудитории. В зависимости от значения
#числа нужно вывести разные сообщения.

echo -n "Number of students: "
read val

case $val in
	0)
		echo "No students"
		;;
	1)
		echo "1 students"
		;;
	2)
		echo "2 students"
		;;
	3)
		echo "3 students"
		;;
	4)
		echo "4 students"
		;;
	*)
		echo "A lot of students"
esac
