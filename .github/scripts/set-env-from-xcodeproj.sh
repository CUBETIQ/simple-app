#!/bin/bash

set -euo pipefail

SCHEME="$(xcodebuild -list -json | jq -r '.project.schemes[0]')"
PRODUCT_NAME="$(xcodebuild -scheme "$SCHEME" -showBuildSettings | grep " PRODUCT_NAME " | sed "s/[ ]*PRODUCT_NAME = //")"

# issue: https://github.blog/changelog/2020-10-01-github-actions-deprecating-set-env-and-add-path-commands
#echo "::set-env name=PRODUCT_NAME::$PRODUCT_NAME"
# resolved: https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-an-environment-variable
echo "name=$PRODUCT_NAME" >> $GITHUB_ENV