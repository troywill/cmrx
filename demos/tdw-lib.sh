PORT=3000
EDITOR=emacs
DEV_DIR=rails_dev
SERVER_SCRIPT="rails-server.sh"
SCRIPT_DIR="../.."
TOP_DIR="../../../.."
LOGFILE='logfile'

function restart_server () {
    cd ${TOP_DIR} && ./${SERVER_SCRIPT} ${PORT}
}
