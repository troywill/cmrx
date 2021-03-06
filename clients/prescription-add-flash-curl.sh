#!/bin/bash
# Example program to add a new prescripion with curl POSTing of XML data
# 2010-09-20 troydwill@gmail.com

HOST='http://stylerx.ath.cx'
# HOST='http://troywill.com:3001'
FLASH_APP_API_KEY='4356e1973d1cf09a450d2704afc35d0e5be2304e'
URL="${HOST}/prescriptions.xml?api_key=${FLASH_APP_API_KEY}"
XML="
<prescription>
  <user-id>4</user-id>
  <!-- <user-security-key>a0757e04f0490c8868bfc0ed1c35882a19160916</user-security-key> -->
  <bust-inches>34</bust-inches>
  <hip-inches>34</hip-inches>
  <waist-inches>34</waist-inches>
  <height-inches>60</height-inches>
  <comfort-in-heels>1</comfort-in-heels>
  <hair-color>8</hair-color>
  <skin-tone>12</skin-tone>
  <dark-circles>1</dark-circles>
  <freckles>0</freckles>
  <loves-skin>1</loves-skin>
  <red-spots>0</red-spots>
  <wrinkles>1</wrinkles>
  <other-skin-issues>0</other-skin-issues>
</prescription>
"

curl --header 'Content-Type:application/xml' \
    --header 'Accept:application/xml' \
    --request POST \
    --data "${XML}" \
    ${URL}

exit
