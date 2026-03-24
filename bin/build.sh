#!/bin/bash

set -e

OUTPUT="dist/bigupweb-theme.zip"

echo "Cleaning old build..."
rm -f $OUTPUT

echo "Ensuring dist folder exists..."
mkdir -p dist

echo "Creating zip package..."

zip -r $OUTPUT \
  bigupweb-theme \
  -x "*.git*" \
  -x "*node_modules*" \
  -x "*.DS_Store"

echo "Done: $OUTPUT created 🥳"