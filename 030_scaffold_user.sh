source ./tdw-lib.sh
NAME='user'

function up () {
#    ${SCRIPT_DIR}/generate scaffold ${NAME} name:string username:string password:string email:string
    ${SCRIPT_DIR}/generate scaffold ${NAME} userid:string password:string creation_date:date first_name:string last_name:string address:string city:string state:string zipcode:string phone_number:string email:string optin:integer
    
    rake db:migrate
}

function down () {
    echo
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${NAME}.rb <<EOF

validates_presence_of :userid
validates_uniqueness_of :userid
validates_presence_of :firstname
validates_presence_of :lastname
validates_presence_of :password
validates_presence_of :creation_date
validates_presence_of :phone_number
validates_presence_of :email
validates_presence_of :optin

EOF
    $EDITOR ${TOP_DIR}/app/models/${NAME}.rb
}

up
edit_model

exit
StyleRX Server design information
=================================

Troy Will <troydwill@gmail.com>
StyleRx Server design information
Wayne Packard <wpackard@mac.com> Fri, Sep 3, 2010 at 10:07 PM
To: Troy Will <troydwill@gmail.com>
Cc: Nick Alt <nalt@clear-media.com>, Jason Buzzeo
<jason.buzzeo@gmail.com>, Joshua Stearns <joshuastearns@gmail.com>
Hi Troy,

Thanks again for meeting with us today!

I've attached some of the information we discussed. The PDF is Apple's
documentation for StoreKit, which is their API for doing in-app
purchases on iOS devices. Most of the parts of the document won't
involve our server directly, but a few pieces apply. At least it will
give you an overview of the entire process. Note that this only
applies to our iPhone app. The Flash client will need to do purchasing
in a completely different way.

Below is the list of fields we have for the user table:

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
