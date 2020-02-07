#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset

# --- Configs ---
source $(pwd)/var-config.sh .

# --- Remove Container (in case the image is already running)
docker rm -f $CTN_NAME || true >/dev/null 2>&1 && \
echo; echo "--- Ghost container is down. ---" && \
echo "--- By Pascal Andy at https://firepress.org/ ---" && echo;