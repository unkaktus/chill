#!/bin/sh
set -e

echo "[+] Installing kernel extension"
sudo cp -r DisableTurboBoost.kext /Library/Extensions/

echo "[+] Enabling autostart service"
sudo cp art.unkaktus.chill.plist /Library/LaunchDaemons/
sudo launchctl load -w /Library/LaunchDaemons/art.unkaktus.chill.plist