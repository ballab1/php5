#!/bin/bash

declare -ar env_php5=(
    'SESSIONS_DIR="${SESSIONS_DIR:-/sessions}"'
    'RUN_DIR="${RUN_DIR:-/var/run/php}"'
)

crf.updateRuntimeEnvironment "${env_php5[*]}" 

crf.copyFileToRuntime 'LIB' 'nginx.bashlib'
crf.copyFileToRuntime 'LIB' 'php.bashlib'
