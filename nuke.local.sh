#!/bin/bash


read -p "Are you sure? THIS WILL NUKE ALL LOCAL CHANGES!: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    repo forall -vc "git reset --hard ; git clean -fdx"
fi


