#!/bin/sh

set -eu
set -o pipefail

# Probably a HACK; integrating into the Antora Docker and releasing that new Docker separately might be optimal?
npm install --global $ASGL

echo "Using $INPUT_SITE_SOURCES_PATH"
cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH
ls -ltr $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

ASGL="antora-site-generator-lunr";DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr NODE_PATH="$(npm --global root)" antora --generator $ASGL --stacktrace $INPUT_ANTORA_PLAYBOOK
