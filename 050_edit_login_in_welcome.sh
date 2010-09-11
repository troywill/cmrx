source ./tdw-lib.sh
WELCOME_CONTROLLER="${TOP_DIR}/app/controllers/welcome_controller.rb"

function edit_login_method () {

cat >> ${WELCOME_CONTROLLER} <<EOF
def login
  session[:register_email] = nil
  if request.post?
    user = User.authenticate(params[:register_email], params[:password])
    if user
      session[:register_email] = user.id
      redirect_to(:action => "index" )
    else
      flash.now[:notice] = "Invalid user/password combination"
    end
  end
end
EOF

${EDITOR} ${WELCOME_CONTROLLER}

}

edit_login_method
