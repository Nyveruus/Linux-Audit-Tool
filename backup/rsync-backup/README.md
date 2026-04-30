# Rsync backup

Systemd service, daily rsync backups to a file system, has dates and logging

- backup.sh - The script to run
- install.sh - installs the script to run to /usr/local/bin/, creates systemd service with timer and enables
- uninstall.sh - disables and deletes systemd services and script.
