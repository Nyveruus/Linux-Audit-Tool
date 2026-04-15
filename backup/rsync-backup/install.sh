#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Root required"
    exit 1
fi
install -m 755 backup.sh /usr/local/bin/backup.sh

cat > /etc/systemd/system/backup.timer << EOF
[Unit]
Description=rsync backup timer

[Timer]
OnCalendar=00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

cat > /etc/systemd/system/backup.service << EOF
[Unit]
Description=rsync backup
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/backup.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now backup.timer
