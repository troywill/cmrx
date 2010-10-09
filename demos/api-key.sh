#!/bin/sh
BASE_URL='http://troywill.com:3000'
RECORD_URL='http://troywill.com:3000/users/1'
API_KEY='3ed1d41ec357a2874e5b891846c84605c93812ad'
URL="http://troywill.com:3000/users/1.json?api_key=${API_KEY}"
curl ${URL}
exit

CONTROLLER='sessions/new'
HEADER_FILE='_fashionrx.header'
COOKIE_FILE='cookie_file'

authenticate () {
    curl --data 'register_email=michael.john.kirk@gmail.co&password=passwor' \
	--dump-header ${HEADER_FILE} \
	${BASE_URL}/${CONTROLLER}
}

write_cookie () {
    grep ookie ${HEADER_FILE} > ${COOKIE_FILE}
}

retrieve_record () {
#    curl --cookie ${COOKIE_FILE} ${RECORD_URL} > data.html
    curl --cookie ${COOKIE_FILE} ${RECORD_URL}.json > data.json
    curl --cookie "_base_session=BAh7CDoOcmV0dXJuX3RvMDoMdXNlcl9pZGkIIgpmbGFzaElDOidBY3Rpb25D%0Ab250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--b8662d8c2de6eba6641835d2ae2820b7363f3ec0" ${RECORD_URL}.yml > data.yml
}

clear_password () {
    curl --data 'email=troydwill@gmail.com&password=passwd1'
}

# authenticate
# write_cookie

retrieve_record


exit

BAh7CDoOcmV0dXJuX3RvMDoMdXNlcl9pZGkIIgpmbGFzaElDOidBY3Rpb25D%0Ab250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--b8662d8c2de6eba6641835d2ae2820b7363f3ec0


Set-Cookie: _base_session=BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo%0ASGFzaHsABjoKQHVzZWR7AA%3D%3D--afb0b2271e38ef17191ed57c7ba8259b3f4ce6a0; path=/
