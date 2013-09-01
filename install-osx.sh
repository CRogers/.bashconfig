#!/bin/sh

PWD=`pwd`
FILE="$HOME/.bash_profile"
echo ". $(PWD)/bash_profile" >$FILE
echo ". $(PWD)/git-completion" >>$FILE

