source ./tdw-lib.sh
NAME='prescription'

function up () {

    ${SCRIPT_DIR}/generate scaffold ${NAME} \
	userid:string \
	requestDate:datetime \
	availableDate:datetime \
	clientType:integer \
	height:integer \
	bustMeasurement:integer \
	waistMeasurement:integer \
	hipMeasurement:integer \
	heels:integer \
	skinIssues:integer \
	productID:string \
	transactionID:string
    
    echo "Running rake db:migrate" && rake db:migrate
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${NAME}.rb <<EOF
validates_presence_of :userid
validates_presence_of :requestDate
validates_presence_of :availableDate
validates_presence_of :clientType
validates_presence_of :height
validates_presence_of :bustMeasurement
validates_presence_of :waistMeasurement
validates_presence_of :hipMeasurement
validates_presence_of :heels
validates_presence_of :skinIssues
validates_presence_of :productID
validates_presence_of :transactionID

EOF
    $EDITOR ${TOP_DIR}/app/models/${NAME}.rb
}

up
edit_model

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
