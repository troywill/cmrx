source ./tdw-lib.sh
# ${SCRIPT_DIR}/generate controller welcome index login logout admin view2
rails generate controller welcome index login logout admin view2
${EDITOR} ${TOP_DIR}/config/routes.rb
mv --interactive --verbose ${TOP_DIR}/public/index.html ${TOP_DIR}/public/index.html.original
cp --interactive --verbose index.html ${TOP_DIR}/public/
