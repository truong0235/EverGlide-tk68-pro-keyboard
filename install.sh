#!/usr/bin/env bash
set -euo pipefail

sudo install -m 755 tk68-pro-repair /usr/local/sbin/tk68-pro-repair
sudo install -m 644 tk68-pro-repair.service /etc/systemd/system/tk68-pro-repair.service
sudo install -m 644 tk68-pro-repair.timer /etc/systemd/system/tk68-pro-repair.timer
sudo systemctl daemon-reload
sudo systemctl enable tk68-pro-repair.timer

printf '%s\n' "Installed. Put Tk68 Pro in pairing mode, then test:"
printf '%s\n' "sudo systemctl start tk68-pro-repair.service"
printf '%s\n' "journalctl -t tk68-pro-repair --since '10 minutes ago' --no-pager"
