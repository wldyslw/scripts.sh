#!/bin/bash
# Cleans git branches that do not exist on remote anymore

git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
