import shutil
import os

# Define las rutas de origen y destino usando os.path.expanduser para manejar ~
carpeta_origen = os.path.expanduser('~/.config/hypr')
carpeta_destino = os.path.expanduser('~/software/arekDot/hypr')

# Verifica que la carpeta de origen existe
if not os.path.exists(carpeta_origen):
    print(f"Error: La carpeta de origen {carpeta_origen} no existe.")
    exit(1)

# Copia toda la carpeta de origen a la carpeta de destino
shutil.copytree(carpeta_origen, carpeta_destino, dirs_exist_ok=True)

print(f"La carpeta {carpeta_origen} ha sido copiada a {carpeta_destino} exitosamente.")


