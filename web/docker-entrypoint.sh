#!/usr/bin/env bash
set -euo pipefail

mkdir -p /run/sshd

# Generate SSH server host keys when they do not exist.
ssh-keygen -A

if [ -d /home/webuser/.ssh ]; then
    chown webuser:webuser /home/webuser/.ssh
    chmod 700 /home/webuser/.ssh
fi

if [ -f /home/webuser/.ssh/authorized_keys ]; then
    chown webuser:webuser /home/webuser/.ssh/authorized_keys
    chmod 600 /home/webuser/.ssh/authorized_keys
fi

/usr/sbin/sshd

exec "$@"