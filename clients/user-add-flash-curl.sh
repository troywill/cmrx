#!/bin/bash
set -o verbose
# Example program to add a new user RESTfully with curl POSTing of XML data
# 2010-09-20 troydwill@gmail.com

HOST='http://stylerx.ath.cx'
# HOST='http://troywill.com:3001'
FLASH_APP_API_KEY='4356e1973d1cf09a450d2704afc35d0e5be2304e'
URL="${HOST}/users.xml?api_key=${FLASH_APP_API_KEY}"

echo "Email?" && read EMAIL
echo "First name?" && read FIRST_NAME
echo "Last name?" && read LAST_NAME

XML="
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<user>
  <email>${EMAIL}</email>
  <first-name>${FIRST_NAME}</first-name>
  <last-name>${LAST_NAME}</last-name>
</user>
"
curl --header 'Content-Type:application/xml' \
    --header 'Accept:application/xml' \
    --request POST \
    --data "${XML}" \
    ${URL}

exit
