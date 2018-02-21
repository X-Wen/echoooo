#!/bin/bash

if [ "$#" -ne "5" ];then
    echo "Usage: update.sh user host port pwd root_pwd\n"
    exit
fi

dir=`dirname $0`

remote_user=$1
remote_host=$2
remote_port=$3
remote_pwd=$4
remote_root_pwd=$5

fis3 release -d ../echoooo_output
cd ..
tar cjf echoooo_output.tar.bz2 echoooo_output
cd -

expect ${dir}/cover_and_restart.exp $remote_user $remote_host $remote_port $remote_pwd $remote_root_pwd ../echoooo_output.tar.bz2 echoooo_output.tar.bz2 echoooo_output
