#!/bin/bash

directorio=${HOME}/.config/hypr/wallpapers

numbers=$(ls -l "$directorio" | grep "^-" | wc -l)

wallpaper_number=$((1 + RANDOM % numbers))

wallpaper_random="${directorio}/wall${wallpaper_number}.png"
MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')
echo $wallpaper_random

hyprctl hyprpaper preload ${wallpaper_random}
# Establece el fondo de pantalla con hyprpaper
hyprctl hyprpaper wallpaper "${MONITOR},${wallpaper_random}"
