source ./tdw-lib.sh
LOGIN_PAGE="${TOP_DIR}/app/views/welcome/login.html.erb"

function edit_login_form () {

cat >> ${LOGIN_PAGE} <<EOF
<fieldset>
  <legend>Please Log In</legend>
  <% form_tag do %>
    <p>
      <label for="name">Email:</label>
      <%= text_field_tag :register_email, params[:register_email] %>
    </p>
    <p>
      <label for="password">Password:</label>
      <%= password_field_tag :password, params[:password] %>
    </p>
    <p>
      <%= submit_tag "Login" %>
    </p>
  <% end %>
</fieldset>
EOF

${EDITOR} ${LOGIN_PAGE}

}

edit_login_form
