#!/bin/bash
DISCORDHOOK=webhooklinkgoeshere 

if [ -d "./crash-reports-old" ]; 
	then
	echo;
	else 
	mkdir -p ./crash-reports-old 
fi




if [ "$(ls -A ./crash-reports)" ]; then
for i in ./crash-reports/crash-*-server.txt
do
	#LOGPASTE=https://paste.fedoraproject.org/
        LOGPASTE=$(fpaste $i | grep https://paste.fedoraproject.org/ | awk '{print $3}')
	direct=$(pwd | awk -F / '{print $3}')
	echo $i;
	mv $i ./crash-reports-old

curl -X POST \
  $DISCORDHOOK \
  -H 'content-type: application/json' \
  -d '{
  "username":"The Crashed Potato",
  "avatar_url": "https://i.imgur.com/4M34hi2.png",
  "content": "",
  "embeds": [
    {
      "title": "'"Server: $direct"'",
      "url": "'"$LOGPASTE"'",
      "description": "'"Crash Report [$i]($LOGPASTE)"'",
      "color": 15258703
    }
  ]
}'
done 
fi
echo potato
