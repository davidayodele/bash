#!/bin/bash
curl -s https://coderbyte.com/api/challenges/logs/web-logs-raw -O > /dev/null
cat web-logs-raw >> logs.txt;

#cat logs.txt

str1="coderbyte heroku/router"
str2="request_id"

id=${str2:11:23}

IFS=$'\n' # define separator as newlines
set -f     # disable globbing
for line in $(cat logs.txt); do
  #echo $line
  #id=${line:148:37}

  if [[ $line == *"$str1"* ]]; then
      #request_id="regmatches($line, regexpr(".{0, 5}request_id.{0, 23}", $line))"
      #request_id="${$str2%*}"
      #request_id="regmatches($line, regexpr(".{1, 10}request_id.{0, 23}", $line))"
      request_id=$line | sed -n "s/^.*request_id\(\S{10}\).*$/\1/p"
      #request_id=echo $line | grep -oP "\request_id\S{23}"
    echo $request_id
  fi
done 