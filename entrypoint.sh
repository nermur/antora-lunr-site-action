#!/bin/sh
ASGL="antora-site-generator-lunr"
set -eu
set -o pipefail 

npm install --global $ASGL
echo "Using $INPUT_SITE_SOURCES_PATH"
cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH
ls -lt --reverse $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr NODE_PATH="$(npm --global root)" antora --generator $ASGL --stacktrace $INPUT_ANTORA_PLAYBOOK
