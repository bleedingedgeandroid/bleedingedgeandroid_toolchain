#!/bin/bash

echo "MUST BE RUN FROM PROJECT ROOT. CTRL+C NOW IF NOT BEING RUN FROM THERE"
echo "giving 10s grace time"

sleep 10
cd out/target/product/generic_arm64
gzip -c system.img > BEA-DSU.gz
echo "Connect ADB authroized device now!"
echo "Giving 10s grace time"
sleep 10
adb push BEA-DSU.gz /storage/emulated/0/Download/
echo "Unlock device and wait on home screen till authorization prompt for DSU arrives. Authorize it"
echo "Giving 10s grace time"
sleep 10
adb shell am start-activity \
-n com.android.dynsystem/com.android.dynsystem.VerificationActivity  \
-a android.os.image.action.START_INSTALL  \
-d file:///storage/emulated/0/Download/BEA-DSU.gz  \
--el KEY_SYSTEM_SIZE $(du -b system.img|cut -f1)  \
--el KEY_USERDATA_SIZE 8589934592
cd ../../../../
echo "Script has done its part. Wait for DSU Installation to complete and then click reboot in the notification"
