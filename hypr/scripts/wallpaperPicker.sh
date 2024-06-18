#!/bin/bash

# Ruta a tu carpeta de fondos de pantalla
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | wofi --dmenu --prompt "Select Wallpaper")

    # Obtén el nombre del monitor (ajusta si es necesario)
MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')

hyprpaperConf="${HOME}/.config/hypr/hyprpaper.conf"

nueva_preload="preload = ${SELECTED_WALLPAPER}"
nuevo_wallpaper="wallpaper = ,${SELECTED_WALLPAPER}"

sed -i "s|^preload = .*|$nueva_preload|" $hyprpaperConf

sed -i "s|^wallpaper = .*|$nuevo_wallpaper|" $hyprpaperConf

echo $SELECTED_WALLPAPER

hyprctl hyprpaper preload "${SELECTED_WALLPAPER}"
# Establece el fondo de pantalla con hyprpaper
hyprctl hyprpaper  wallpaper "${MONITOR},${SELECTED_WALLPAPER}"


#EDITAR CONFIGURACION DE HYPAPER







