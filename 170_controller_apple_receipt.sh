source ./tdw-lib.sh
CONTROLLER_NAME='apple/recipt'

function up () {

    ${SCRIPT_DIR}/generate controller ${CONTROLLER_NAME} record verify 

}

up

#######################################################################################

exit

Usage: ../../../script/generate controller ControllerName [options]

Rails Info:
    -v, --version                    Show the Rails version number and quit.
    -h, --help                       Show this help message and quit.

General Options:
    -p, --pretend                    Run but do not make any changes.
    -f, --force                      Overwrite files that already exist.
    -s, --skip                       Skip files that already exist.
    -q, --quiet                      Suppress normal output.
    -t, --backtrace                  Debugging: show backtrace on errors.
    -c, --svn                        Modify files with subversion. (Note: svn must be in path)
    -g, --git                        Modify files with git. (Note: git must be in path)

Description:
    Stubs out a new controller and its views. Pass the controller name, either
    CamelCased or under_scored, and a list of views as arguments.

    To create a controller within a module, specify the controller name as a
    path like 'parent_module/controller_name'.

    This generates a controller class in app/controllers, view templates in
    app/views/controller_name, a helper class in app/helpers, and a functional
    test suite in test/functional.

Example:
    `./script/generate controller CreditCard open debit credit close`

    Credit card controller with URLs like /credit_card/debit.
        Controller: app/controllers/credit_card_controller.rb
        Views:      app/views/credit_card/debit.html.erb [...]
        Helper:     app/helpers/credit_card_helper.rb
        Test:       test/functional/credit_card_controller_test.rb

Modules Example:
    `./script/generate controller 'admin/credit_card' suspend late_fee`

    Credit card admin controller with URLs /admin/credit_card/suspend.
        Controller: app/controllers/admin/credit_card_controller.rb
        Views:      app/views/admin/credit_card/debit.html.erb [...]
        Helper:     app/helpers/admin/credit_card_helper.rb
        Test:       test/functional/admin/credit_card_controller_test.rb

