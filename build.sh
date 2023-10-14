#!/bin/bash

echo "MUST BE RUN FROM PROJECT ROOT. CTRL+C NOW IF NOT BEING RUN FROM THERE"
echo "giving 10s grace time"

sleep 10

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch gsi_arm64-userdebug
repo init https://github.com/bleedingedgeandroid/manifest -b udc

read -p "Do repo sync?: " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    repo sync
fi

m -j32
