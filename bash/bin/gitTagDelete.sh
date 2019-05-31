#!/usr/bin/env bash

# A script to delete a local and remote git tag on the current repository
#
# Uasge
#    gitTagDelete -<tag name>
#
# Input
#   $1 - tagname
#
# Output
#   bash status: 0=OK, other=failed
#
set -e

if [ $# -eq 0 ]
  then
    echo "No tag supplied"
  else
    Tag=$1

    # delete the remote tag
    git push -v origin :refs/tags/$Tag

    # Delete the local tag
    git tag --delete $Tag
fi
