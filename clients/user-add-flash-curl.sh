#!/bin/bash
# Example program to add a new user RESTfully with curl POSTing of XML data
# 2010-09-20 troydwill@gmail.com

HOST='http://stylerx.ath.cx'
HOST='http://troywill.com:3001'
FLASH_APP_API_KEY='b1b5bf7b7e8c99e0b8b720d4b17004833dc69cb5'
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
