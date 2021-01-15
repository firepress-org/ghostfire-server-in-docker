#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset

# Map all external themes you locally here
# Un-comment 'source ./fct_rsync_nodelete.sh .' as needed

_theme_name-="theme1"
DIR_FROM_EXTERNAL="/myuser/workspace/${_theme_name}"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/${_theme_name}"
#source ./fct_rsync_nodelete.sh .

_theme_name-="theme2"
DIR_FROM_EXTERNAL="/myuser/workspace/${_theme_name}"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/${_theme_name}"
#source ./fct_rsync_nodelete.sh .

_theme_name-="theme3"
DIR_FROM_EXTERNAL="/myuser/workspace/${_theme_name}"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/${_theme_name}"
#source ./fct_rsync_nodelete.sh .
