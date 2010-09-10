source ./tdw-lib.sh
NAME='package'
PLURAL_NAME='packages'

function up () {
    ${SCRIPT_DIR}/generate scaffold ${NAME} package_meta_id:integer short_name:string name:string latest_version:string date_checked:date date_released:date
    rake db:migrate
}

function down () {
    echo
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF

validates_presence_of :package_meta_id
validates_presence_of :short_name
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
edit_welcome_view
migration
