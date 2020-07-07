#!/bin/sh -

SCRIPT_DIR=$(cd $(dirname "$0"); pwd)
CONFIG_FILE="$HOME/.tmux.conf"
CONFIG_BACKUP_FILE="$HOME/.tmux.conf.back"

if [ -f "$CONFIG_FILE" ]; then
  cp "$CONFIG_FILE" "$CONFIG_BACKUP_FILE"
fi

ln -sf "$SCRIPT_DIR/init.conf" "$CONFIG_FILE"
