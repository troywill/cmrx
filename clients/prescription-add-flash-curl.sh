#!/bin/bash
# Example program to add a new user RESTfully with curl POSTing of XML data
# 2010-09-20 troydwill@gmail.com

EMAIL='foo@bar.com'
FIRST_NAME='Betty'
LAST_NAME='White'
HOST='http://stylerx.ath.cx'
API_KEY='784da8554937a966ec97aec8ed1ec659e25e334b'
URL="${HOST}/prescriptions.xml?api_key=${API_KEY}"
XML="<?xml version=\"1.0\" encoding=\"UTF-8\"?><user><email>${EMAIL}</email><first-name>${FIRST_NAME}</first-name><last-name>${LAST_NAME}</last-name></user>"
XML="<prescription><bust-inches>34</bust-inches><hip-inches>34</hip-inches><waist-inches>34</waist-inches><height-inches>60</height-inches><comfort-in-heels>1</comfort-in-heels><hair-color>8</hair-color><skin-tone>12</skin-tone><dark-circles>1</dark-circles><freckles>0</freckles><loves-skin>1</loves-skin><red-spots>0</red-spots><wrinkles>1</wrinkles><other-skin-issues>0</other-skin-issues><user-id>4</user-id><user-security-key>a0757e04f0490c8868bfc0ed1c35882a19160916</user-security-key></prescription>"

curl --header 'Content-Type:application/xml' \
    --header 'Accept:application/xml' \
    --request POST \
    --data "${XML}" \
    ${URL}

exit


