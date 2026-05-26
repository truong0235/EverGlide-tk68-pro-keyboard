#!/usr/bin/env bash
set -euo pipefail

sudo systemctl disable --now tk68-pro-repair.timer || true
sudo systemctl stop tk68-pro-repair.service || true
sudo rm -f /etc/systemd/system/tk68-pro-repair.service
sudo rm -f /etc/systemd/system/tk68-pro-repair.timer
sudo rm -f /usr/local/sbin/tk68-pro-repair
sudo systemctl daemon-reload

printf '%s\n' "Uninstalled tk68-pro-repair systemd timer, service, and script."
