source ./tdw-lib.sh
NAME='content_file'

function up () {
#    ${SCRIPT_DIR}/generate model ${NAME} register_email:string avail_interval:integer download_file:integer
    rails generate model ${NAME} register_email:string avail_interval:integer download_file:integer
}

function down () {
    echo
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF

validates_presence_of :name
validates_presence_of :username
validates_uniqueness_of :username
validates_presence_of :password
EOF

    $EDITOR ${MODEL}

    echo "Don't forget to edit foreign key model, if applicable" && sleep 1
    
}

function edit_welcome_view () {
    $EDITOR ${TOP_DIR}/app/views/welcome/index.html.erb
}

function migration () {
    echo
}

#######################################################################################

up
edit_model
# edit_welcome_view
# migration
