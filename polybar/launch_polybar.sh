if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload nhatpc$m --config=~/.config/polybar/config.ini &
  done
else
  polybar --reload nhatpc --config=~/.config/polybar/config.ini &
fi
