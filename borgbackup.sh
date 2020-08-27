#!/usr/bin/env bash

# Samba Configuration
SMB_ADDR=192.168.1.1 # IP/Hostname
SMB_PATH=/path/on/share # Path inside SMB share
SMB_DEST=/mnt/smb-backup # Local mount point
SMB_USER=username # SMB Username
SMB_PASS="$(sudo -u username bash -c 'pass show personal/sambapassword')" # set 'username' to your own username, and change the pass command to fit your needs

# Test if we can reach the destination server. If not, abort
if [[ $(ping -c 3 "$SMB_ADDR" | grep 'icmp_seq') ]]; then
  info "Ping succesful"
else
  info "Can't ping destination host. Aborting"
  exit 1
fi

# Borg configuration
# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO="$SMB_DEST"/borg
# Ask an external program (pass) to supply the passphrase:
export BORG_PASSCOMMAND="sudo -u username bash -c 'pass show personal/borgbackup'" # set 'username' to your own username, obviously update the pass command to fit your needs

# Start by mounting share through the SMB protocol
if [ $(mount | grep -c "$SMB_DEST") -eq 0 ]; then
  mount -t cifs //"$SMB_ADDR/$SMB_PATH" "$SMB_DEST" -ousername="$SMB_USER",password="$SMB_PASS"
  mount_exit=$?

  if [ ${mount_exit} -ne 0 ]; then
    info "Mount failed. Aborting"
    exit 1
  fi
else
  info "Samba share already mounted"
fi

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                                          \
    --verbose                                        \
    --filter AME                                     \
    --list                                           \
    --stats                                          \
    --show-rc                                        \
    --compression lz4                                \
    --exclude-caches                                 \
    --exclude '/home/*/.cache/*'                     \
    --exclude '/var/cache/*'                         \
    --exclude '/var/tmp/*'                           \
    --exclude '/var/snap/*'                          \
    --exclude '/var/lib/snapd/*'                     \
    --exclude '/home/user/Documents/libvirt/*'       \ # Change "user" to actual username and remove this comment
    --exclude '/home/user/.local/share/akonadi/*'    \ # Change "user" to actual username and remove this comment
                                                     \
    ::'{hostname}-{now}'                             \
    /etc                                             \
    /home                                            \
    /root                                            \
    /var                                             \

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

info "Unmounting Samba share"
umount "$SMB_DEST"

exit ${global_exit}
