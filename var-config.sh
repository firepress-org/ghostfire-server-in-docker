#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset

# ghost version, find latest image ==> https://hub.docker.com/r/devmtl/ghostfire/tags
GHOST_IMG="devmtl/ghostfire:stable_3.40.5_4f6eb6b_2021-01-09_03H26s32"

# Sync external theme(s) (OPTIONAL)
#DIR_FROM_EXTERNAL="/Volumes/960G/_pascalandy/11_FirePress/GitLab/firepress-ghost-themes-private-grp/ghost-themes/nurui_firepress-org-en/nurui-stg"
#DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/nurui-stg"

DIR_FROM_EXTERNAL="/Volumes/960G/_pascalandy/11_FirePress/Github/github_pascalandy/Casper/dist/casper-search"
DIR_INTO_EXTERNAL="${DIR_MY_THEMES}/casper-search"

# --- DO NOT UPDATE ==> These var are relative to this projet
export ROOT_PROJECT="$(pwd)"
LOCAL_PATH="${ROOT_PROJECT}/content"
DIR_MY_THEMES="${ROOT_PROJECT}/_my_themes/"
DIR_CONTENT_THEMES="${ROOT_PROJECT}/content/themes"
CTN_NAME="ghostUAT"
CONTAINER_PATH="/var/lib/ghost/content"
ALPINE_IMG="devmtl/alpine-base:3.8A"
WAIT_TIMER="3600" # shutdown the container after 3600 seconds ( 1 hour)

