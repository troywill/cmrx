source ./tdw-lib.sh
NAME='user'

function generate_scaffold () {
    COMMAND="${SCRIPT_DIR}/generate scaffold ${NAME} \
	user_id:string \
	password:string \
	creation_date:date \
	first_name:string \
	last_name:string \
	address:string \
	city:string \
	state:string \
	zipcode:string \
	phone_number:string \
	email:string \
	email_opt_in:character \
	skin_tone_id:integer \
	hair_color_id:integer"

    echo "==> ${COMMAND} >> ${LOGFILE}" && ${COMMAND}
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${NAME}.rb <<EOF
# Per Nick Alt Sep. 9, 2010 All fields are required
validates_presence_of :userid
validates_uniqueness_of :userid
validates_presence_of :password
validates_presence_of :creation_date
validates_presence_of :first_name
validates_presence_of :last_name
validates_presence_of :address
validates_presence_of :city
validates_presence_of :state
validates_presence_of :zipcode
validates_presence_of :phone_number
validates_presence_of :email
validates_presence_of :email_opt_in
validates_numericality_of :email_opt_in
EOF
    COMMAND="$EDITOR ${TOP_DIR}/app/models/${NAME}.rb"
    echo "==> ${COMMAND}" && sleep 1 && ${COMMAND}
}

generate_scaffold
sleep 3
edit_model
echo "Edit migration for default values and run migration => rake db:migrate"

exit

UserID - we're planning to use the email address as the user ID. It's
a primary key and we'll need to ensure uniqueness
Password - it would be better if we could store a hashed value rather
than the actual password. There should be some off-the-shelf modules
for handling this on the server.
Account creation date
First Name
Last Name
Address Street
City
State
Zipcode
Phone number
Email address (note that the email address will also be the user's ID.
I think it would be helpful to have a separate email address field in
case we later allow them to enter a different address to receive
marketing emails. For now we can automagically populate this field
with the email address provided for registration. Note that unlike the
userID email address, this one doesn't have to be ensured unique.
Email Opt-In - this is just a boolean to indicate whether they will
allow us to send them marketing email.

*Skin Tone
*Hair Color

  * As we discussed in the meeting, we haven't decided yet whether
    skin tone and hair color are attributes of the user or of the
    style prescription, so these may or may not end up in this table.

If we decide to continue allowing registration on the phone and the
desktop, then we may want to store which they used to register. If we
only allow registration from the desktop, then we may want to keep
track of whether they've used the iPhone app.

We'll also need to be able to determine whether we've given the iPhone
users their one free style prescription (that's included in the app).
It's probably better to derive than from the data in the style
prescriptions (history) table, but if we need to denormalize it for
performance we could put a field here (but only if we force
registration on the iPhone before allowing them to request a
prescription).

I believe that's all, let me know if I've forgotten anything.

I'll work on the data for some of the other tables and send that to
you some time this weekend.

Feel free to email any questions you have.

Thanks!

wp

StoreKitGuide.pdf
2043K
