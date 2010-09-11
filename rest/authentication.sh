#!/bin/sh
URL='http://192.168.1.5:3000/welcome/login'
curl --data 'register_email=troydwill@gmail.com&password=passwd1' \
    --dump-header _fashionrx.header \
    ${URL}
