#!/bin/bash
source ./tdw-lib.sh
# See page 183 of Agile Web Development with Rails - Creating a REST interface
COMMAND="ruby ${SCRIPT_DIR}/generate controller jsoninfo customer"
echo "==> ${COMMAND}" && ${COMMAND}
