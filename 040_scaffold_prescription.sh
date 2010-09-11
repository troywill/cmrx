source ./tdw-lib.sh
NAME='prescription'

function generate_scaffold () {

    ${SCRIPT_DIR}/generate scaffold ${NAME} \
	user_id:string \
	request_date:datetime \
	available_date:datetime \
	client_type:integer \
	height:integer \
	bust_measurement:integer \
	waist_measurement:integer \
	hip_measurement:integer \
	heels:integer \
	skin_issues:integer \
	product_id:string \
	transaction_id:string
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${NAME}.rb <<EOF
validates_presence_of :user_id
validates_presence_of :request_date
validates_presence_of :available_date
validates_presence_of :client_type
validates_presence_of :height
validates_presence_of :bust_measurement
validates_presence_of :waist_measurement
validates_presence_of :hip_measurement
validates_presence_of :heels
validates_presence_of :skin_issues
validates_presence_of :product_id
validates_presence_of :transaction_id

EOF
    $EDITOR ${TOP_DIR}/app/models/${NAME}.rb
}

$EDITOR ${TOP_DIR}/db/
generate_scaffold
edit_model

echo "Running rake db:migrate" && rake db:migrate
exit
Prescriptions table

Here.s what I.m thinking will work as a starting point for the prescription and transaction tables. The prescription table has the data for populating the history view on the client. I think we should be able to use a null transaction ID to indicate the one .free. style guide for the iPhone clients. The tricky part here is that, if we don.t require the iPhone users to register, the userID will be empty until/unless they login. When they do login, we.ll need a way to figure out which style guides (already purchased with their iTunes account) belong to them.

Prescriptions Table
-........-
userid (string)
requestDate (date)
availableDate(date) . this is the date/time that the style prescription will be allowed to be displayed to the user (one hour from the request date by our current design).
clientType (integer) . Flash or iPhone . we may or may not need this
height (integer)
bustMeasurement (integer)
waistMeasurement (integer)
hipMeasurement (integer)
heels (integer)
skinIssues (maybe bitfield?)
productID (string)
transactionID (string) . This will be the key into the transaction table that corresponds to the client type

We may be able to have a single transaction table with a column indicating whether the transaction came from the iPhone or Flash app, but it may be cleaner to keep app store transactions and Flash app transactions in different tables.
