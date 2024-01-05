#!/bin/bash

# Get the changes using git diff
ADDED=$(git diff --cached --name-only --diff-filter=A)
MODIFIED=$(git diff --cached --name-only --diff-filter=M)
DELETED=$(git diff --cached --name-only --diff-filter=D)

# Build the commit message
commit_message=""

if [ -n "$ADDED" ]; then
  commit_message+="Added: $ADDED"
fi

if [ -n "$MODIFIED" ]; then
  [ -n "$commit_message" ] && commit_message+=" | "
  commit_message+="Modified: $MODIFIED"
fi

if [ -n "$DELETED" ]; then
  [ -n "$commit_message" ] && commit_message+=" | "
  commit_message+="Deleted: $DELETED"
fi

# Commit changes with the dynamic message
git commit -m "$commit_message"
