#!/usr/bin/env bash
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o nounset


mkdir -pv "$DIR_FROM"
mkdir -pv "$DIR_INTO"

# Perform Copy
echo; echo; \
rsync -avzh --progress --delete $DIR_FROM/ $DIR_INTO/; \

# Display
echo; echo; echo "AFTER synching:"; echo; \
echo "FROM: "; pwd; ls -AlhF $DIR_FROM; du -sh; echo; \
echo "INTO: "; pwd; ls -AlhF $DIR_INTO; du -sh; echo;

# RM those files .zip .editorconfig .git .github because we DON'T want a git in a git shit
rm -rf .git/ || true;
rm .gitignore || true;
rm .github || true;
rm -rf *.zip || true;

ls -AlhF; du -sh; echo;