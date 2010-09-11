#!/bin/sh
URL='http://192.168.1.5:3000/users/1'
curl --cookie cookie_01 \
    --dump-header _fashionrx.header \
    ${URL}
