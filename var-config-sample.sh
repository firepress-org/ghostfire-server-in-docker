#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset

# --- No need to update these. These var are relative to this projet
export ROOT_PROJECT="$(pwd)"
export LOCAL_PATH="${ROOT_PROJECT}/content"
export DIR_MY_THEMES="${ROOT_PROJECT}/_my_themes/"
export DIR_CONTENT_THEMES="${ROOT_PROJECT}/content/themes"
export CTN_NAME="ghostUAT"
export CONTAINER_PATH="/var/lib/ghost/content"
export ALPINE_IMG="devmtl/alpine-base:3.8A"
  # shutdown the container after 3600 seconds ( 1 hour)
export  WAIT_TIMER="3600" 
  # ghost version, find latest images ==> https://hub.docker.com/r/devmtl/ghostfire/tags
  # Ideally use a specific image like: GHOST_IMG="devmtl/ghostfire:stable_3.40.5_4f6eb6b_2021-01-09_03H26s32"
export GHOST_IMG="devmtl/ghostfire:stable"