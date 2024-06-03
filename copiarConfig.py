import os
import shutil

# Define las rutas de origen y destino usando os.path.expanduser para manejar ~


path = os.path.expanduser
# carpeta_origen = os.path.expanduser('~/.config/hypr')
carpetas_origen = [
    path("~/.config/hypr"),
    path("~/.config/wofi"),
    path("~/.config/nvim"),
]
carpeta_destino = os.path.expanduser("~/software/arekDot")

# Verifica que la carpeta de origen existe

for carpeta in carpetas_origen:
    if not os.path.exists(carpeta):
        print(f"Error: La carpeta de origen {carpeta} no existe.")
        exit(1)

# Copia toda la carpeta de origen a la carpeta de destino


for carpeta in carpetas_origen:
    agregar_carpeta = carpeta[carpeta.rfind("/") : :]
    shutil.copytree(carpeta, carpeta_destino + agregar_carpeta, dirs_exist_ok=True)
    print(f"La carpeta {carpeta} ha sido copiada a {carpeta_destino} exitosamente.")
