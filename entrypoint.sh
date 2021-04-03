#!/bin/sh
ASGL="antora-site-generator-lunr"
set -eu
set -o pipefail
export DOCSEARCH_ENABLED=true
export DOCSEARCH_ENGINE=lunr
export NODE_PATH="$(npm --global root)"

npm install --global $ASGL
echo "Using $INPUT_SITE_SOURCES_PATH"
cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH
ls -lt --reverse $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH
antora --generator $ASGL --stacktrace $INPUT_ANTORA_PLAYBOOK
