#!/bin/bash
# ~/.local/bin/audio-inhibit
while sleep 50; do
  if pactl list sink-inputs 2>/dev/null | grep -q 'Corked: no'; then
    xset s reset
  fi
done
