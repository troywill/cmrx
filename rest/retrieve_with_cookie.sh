#!/bin/sh
URL='http://troywill.com:3000/users/1'
curl --cookie cookie_01 \
    --dump-header _fashionrx.header \
    ${URL}
