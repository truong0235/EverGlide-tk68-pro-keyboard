# Tk68 Pro Bluetooth Repair

Repairs `Tk68 Pro` BLE reconnect failures after boot without blocking boot.

## Behavior

- Starts 20 seconds after boot using a systemd timer.
- Removes any saved `Tk68 Pro` devices every time it starts.
- Scans, pairs, trusts, and connects a newly discovered `Tk68 Pro`.
- Treats connection as good only when `Connected: yes` and `Battery Percentage:` are present.
- Retries for 5 minutes.
- Exits successfully after timeout so boot/session is not failed.

## Install

```bash
chmod +x install.sh
./install.sh
```

## Manual Test

Put `Tk68 Pro` in pairing mode first, then run:

```bash
sudo systemctl start tk68-pro-repair.service
journalctl -t tk68-pro-repair --since "10 minutes ago" --no-pager
systemctl status tk68-pro-repair.service --no-pager
```

## Timer Control

Enable and start:

```bash
sudo systemctl enable --now tk68-pro-repair.timer
```

Disable:

```bash
sudo systemctl disable --now tk68-pro-repair.timer
```

## Uninstall

```bash
sudo systemctl disable --now tk68-pro-repair.timer
sudo rm -f /etc/systemd/system/tk68-pro-repair.service
sudo rm -f /etc/systemd/system/tk68-pro-repair.timer
sudo rm -f /usr/local/sbin/tk68-pro-repair
sudo systemctl daemon-reload
```
