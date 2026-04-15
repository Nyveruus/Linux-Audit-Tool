#!/bin/bash

backup_src="/home/"
backup_mount="/mnt/backup"
if [[ ! -e "$backup_mount" ]]; then
    echo -e "backup point not accesible, aborting"
    exit 1
fi
backup_dest="$backup_mount/current"
current_date=$(date +%Y-%m-%d)
log_path="$backup_mount/logs"
previous_files="$backup_mount/files_previous/$current_date"

mkdir -p "$log_path"
mkdir -p "$previous_files"

rsync -av --delete --backup \
  --backup-dir="$previous_files" "$backup_src" "$backup_dest" \
  > "$log_path/backup_$current_date.log" \
  2> "$log_path/backup_${current_date}_error.log"
