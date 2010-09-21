#!/bin/bash
# Example program to add a new user RESTfully with curl POSTing of XML data
# 2010-09-20 troydwill@gmail.com

EMAIL='troydwill@gmail.com.com'
FIRST_NAME='Troy'
LAST_NAME='Will'
HOST='http://stylerx.ath.cx'
HOST='http://troywill.com:3002'
API_KEY='784da8554937a966ec97aec8ed1ec659e25e334b'
URL="${HOST}/users.xml?api_key=${API_KEY}"
XML="<?xml version=\"1.0\" encoding=\"UTF-8\"?><user><email>${EMAIL}</email><first-name>${FIRST_NAME}</first-name><last-name>${LAST_NAME}</last-name></user>"

curl --header 'Content-Type:application/xml' \
    --header 'Accept:application/xml' \
    --request POST \
    --data "${XML}" \
    ${URL}

exit
