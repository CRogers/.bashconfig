#!/bin/sh

BASHCONFIG=`pwd`
FILE="$HOME/.bash_profile"
echo "BASHCONFIG='$BASHCONFIG'" >$FILE
echo ". $BASHCONFIG/bash_profile.sh" >>$FILE
echo ". $BASHCONFIG/git-completion.sh" >>$FILE