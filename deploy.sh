#!/bin/bash
# NOTIONARY DEPLOY — pushes app to notionary.uozon.com
# Usage: ./deploy.sh   (run from ~/Documents/uozon/notionary)
#
# NON-DESTRUCTIVE: never wipes the docroot. Overwrites tracked files only.
# Excludes: config.php (per-env secret), cache/* (runtime), any media bundle.
set -e
cd "$(dirname "$0")"

echo "=== NOTIONARY DEPLOY ==="

# Require bin/build to have been run
BUILT="js/notionary-deve.js"
if [ ! -f "$BUILT" ]; then
  echo "ERROR: $BUILT missing — run bin/build first." >&2
  exit 1
fi

echo "Building tarball..."
COPYFILE_DISABLE=1 tar czf /tmp/notionary_deploy.tar.gz \
  --exclude='.DS_Store'        \
  --exclude='._*'              \
  --exclude='*.sh'             \
  --exclude='config.php'       \
  --exclude='cache/*'          \
  --exclude='PENDING.md'       \
  --exclude='.git'             \
  --exclude='.gitignore'       \
  --exclude='dev'              \
  --exclude='*.sql'            \
  --exclude='*.sql.gz'         \
  .

SIZE=$(du -h /tmp/notionary_deploy.tar.gz | cut -f1)
echo "Tarball: ${SIZE}"

REMOTE_DOCROOT="/var/www/vhosts/uozon.rubidium.selfhost.de/notionary"

echo "Uploading to rubidium..."
scp /tmp/notionary_deploy.tar.gz uozon@rubidium.selfhost.de:/tmp/

echo "Extracting on server (non-destructive: no docroot wipe)..."
ssh uozon@rubidium.selfhost.de \
  "cd ${REMOTE_DOCROOT} && find . -maxdepth 1 -name '._*' -delete && tar xzf /tmp/notionary_deploy.tar.gz && rm /tmp/notionary_deploy.tar.gz"

echo "=== DEPLOYED $(date '+%Y-%m-%d %H:%M:%S') ==="
