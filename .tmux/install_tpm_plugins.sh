#!/bin/bash
tmux new-session -d -s plugin_install_session
sleep 2
tmux send-keys -t plugin_install_session "/Users/maehachi08/.tmux/plugins/tpm/bin/install_plugins 2>&1 >> /Users/maehachi08/.tmux/tpm_install_plugins.log" C-m
sleep 2
while true; do
  count=`ps aux | grep 'tpm/bin/install_plugins' | grep -v 'grep' | wc -l`
  if [ "${count}" -eq 0 ]; then
    break
  fi
done
tmux kill-session -t plugin_install_session
