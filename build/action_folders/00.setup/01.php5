#!/bin/bash

declare -ar env_php5=(
    'SESSIONS_DIR="${SESSIONS_DIR:-/sessions}"'
    'RUN_DIR="${RUN_DIR:-/var/run/php}"'
)

lib.updateRuntimeEnvironment "${env_php5[*]}" 

lib.copyFileToRuntime 'LIB' 'nginx.bashlib'
lib.copyFileToRuntime 'LIB' 'php.bashlib'
