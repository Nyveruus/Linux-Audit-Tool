#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Root required"
    exit 1
fi

systemctl disable --now backup.timer
systemctl daemon-reload

rm -f /etc/systemd/system/backup.timer
rm -f /etc/systemd/system/backup.service
rm -f /usr/local/bin/backup.sh
