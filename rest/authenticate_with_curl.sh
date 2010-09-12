#!/bin/bash

BASE_URL='http://192.168.1.5:3000'
CONTROLLER='welcome/login'
HEADER_FILE='_fashionrx.header'
COOKIE_FILE='cookie_file'
RECORD_URL='http://192.168.1.5:3000/users/1'

authenticate () {
    curl --data 'register_email=troydwill@gmail.com&password=passwd1' \
	--dump-header ${HEADER_FILE} \
	${BASE_URL}/${CONTROLLER}
}

write_cookie () {
    grep ookie ${HEADER_FILE} > ${COOKIE_FILE}
}

retrieve_record () {
    curl --cookie ${COOKIE_FILE} ${RECORD_URL} > data.html
    curl --cookie ${COOKIE_FILE} ${RECORD_URL}.json > data.json
    curl --cookie ${COOKIE_FILE} ${RECORD_URL}.yml > data.yml
}

clear_password () {
    curl --data 'register_email=troydwill@gmail.com&password=passwd1'
}

authenticate
write_cookie
retrieve_record
