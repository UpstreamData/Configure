@echo off
setlocal enabledelayedexpansion
cd /D %~dp0
for /f %%A IN (IPList.txt) DO (
scp -o "StrictHostKeyChecking no" "%~dp0config.toml" root@%%~A:/etc/bosminer.toml
ssh -o "StrictHostKeyChecking no" root@%%~A /sbin/reboot
)
echo All miners should now be configured.
pause