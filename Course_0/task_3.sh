#usr/bin/env bash

#Напишите скрипт на bash, который будет определять в какую возрастную группу
#попадают пользователи. При запуске скрипт должен вывести сообщение "enter
#your name" и ждать от пользователя ввода имени. Конда имя ввдено, то скрипт
#должен написать "enter your age" и ждать ввода возраста. Когда возраст введён,
#скрипт пишет на экран "<Имя>, your group is <группа>", где <группа> определяется
#на основе возраста по следующим правилам: <= 16 = "child", {17, 25} = "youth",
#> 25 = "adult". После этого всё начинается по новой, пока не будет пустое имя
#или пока возраст не будет <= 0

name="someone"
age=1

while :
do
	echo -n "\nEnter your name: "
	read name
	echo -n "Enter your age: "
	read age
	if [ -z $name ] || [ $age -eq 0 ]
	then
		echo "\nbye"
		break
	fi

	if [ 0 -lt $age ] && [ $age -le 16 ]
	then
		echo "$name, your group is \"child\""
	elif [ 17 -le $age ] && [ $age -le 25 ]
	then
		echo "$name, your group is \"youth\""
	else
		echo "$name, your group is \"adult\""
	fi
done
