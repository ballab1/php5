#!/bin/bash

chown "${www['user']}":"${www['group']}" -R "$SESSIONS_DIR"
chown "${www['user']}":"${www['group']}" -R "$RUN_DIR"
chown "${www['user']}":"${www['group']}" -R "$WORKING_DIR"
