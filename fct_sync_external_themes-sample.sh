#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset

# Sync external theme
DIR_FROM_EXTERNAL="/myuser/workspace/theme1"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/theme1"
source ./fct_rsync_nodelete.sh .

# Sync external theme
DIR_FROM_EXTERNAL="/myuser/workspace/theme2"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/theme2"
source ./fct_rsync_nodelete.sh .

# Sync external theme
DIR_FROM_EXTERNAL="/myuser/workspace/theme3"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/theme3"
source ./fct_rsync_nodelete.sh .

# Map all themes you have here