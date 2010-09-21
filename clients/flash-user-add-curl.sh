#!/bin/bash
EMAIL='foo@bar.com'
FIRST_NAME='Betty'
LAST_NAME='White'
HOST='http://stylerx.ath.cx'
API_KEY='784da8554937a966ec97aec8ed1ec659e25e334b'
URL="${HOST}/users.xml?api_key=${784da8554937a966ec97aec8ed1ec659e25e334b"
XML="<?xml version="1.0" encoding="UTF-8"?><user><email>${EMAIL}</email><first-name>John</first-name><last-name>Doe</last-name></user>"
curl --header 'Content-Type:application/xml' \
    --header 'Accept:application/xml' \
    --request POST \
    --data "${XML}" \
    ${URL}

exit
