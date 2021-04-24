#!/bin/bash

# Showing Variable Use Between Shells
# this script do cd $dir but after script exec we are not in that dir 

echo "Which dir do you whant to activate"
read DIR

cd $DIR
pwd
ls

exit 0

# The reason is that while running the script we are in a subshell. So this cd dir is happening in a subshell, and this pwd is happening in a subshell. And ls is happening in a subshell. So it's opening a new environment for running the script. And once it has completed everything that needs to be done in the script, it is using exit zero to get back to the parent shell. And the parent shell, that is where we started the original script.
