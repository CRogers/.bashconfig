#!/bin/sh

BASHCONFIG=`pwd`
FILE="$HOME/.bashrc"
echo "BASHCONFIG='$BASHCONFIG'" >$FILE
echo ". $BASHCONFIG/bash_profile.sh" >>$FILE