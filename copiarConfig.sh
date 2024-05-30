#!/bin/bash

filesCopy=(

	"${HOME}/.config/hypr"





)


Destination="${HOME}/software/arekDot"



for files in "${filesCopy[@]}"; do
	if [-e "$file"]; then
		echo "Copiando $files..."
		cp -r "$file" "$Destination/"
	else
		echo "Archivo no existe."
	fi
done

