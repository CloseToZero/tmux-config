#!/bin/sh -

SCRIPT_DIR=$(cd $(dirname "$0"); pwd)
CONFIG_FILE="$SCRIPT_DIR/init.conf"
CONFIG_WRAP_FILE="$SCRIPT_DIR/init-wrapper.conf"
CONFIG_INSTALL_FILE="$HOME/.tmux.conf"
CONFIG_BACKUP_FILE="$HOME/.tmux.conf.back"

cat <<EOF > "$CONFIG_WRAP_FILE"
TMUX_CONFIG_DIR="$SCRIPT_DIR"
source-file "$CONFIG_FILE"
EOF

if [ -f "$CONFIG_INSTALL_FILE" ]; then
  if [ -f "$CONFIG_BACKUP_FILE" ]; then
    echo "Try to backup $CONFIG_INSTALL_FILE as $CONFIG_BACKUP_FILE, but $CONFIG_BACKUP_FILE already exists"
    exit 1
  fi
  cp "$CONFIG_INSTALL_FILE" "$CONFIG_BACKUP_FILE"
fi

echo "Install to $CONFIG_INSTALL_FILE"
ln -sf "$CONFIG_WRAP_FILE" "$CONFIG_INSTALL_FILE"
