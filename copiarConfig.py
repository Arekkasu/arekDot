import os
import shutil

# Define las rutas de origen y destino usando os.path.expanduser para manejar ~


path = os.path.expanduser
# carpeta_origen = os.path.expanduser('~/.config/hypr')
carpetas_origen = [
    path("~/.config/hypr"),
    path("~/.config/nvim"),
    path("~/.config/fastfetch"),
    path("~/.config/waybar"),
    path("~/.config/rofi"),
    path("~/.config/kitty"),
    path("~/.config/swaync")
]

archivos_configuracion = [

    path("~/.zshrc")


]

allCarpetas = archivos_configuracion+carpetas_origen

carpeta_destino = os.path.expanduser("~/software/arekDot")

# Verifica que la carpeta de origen existe

for carpeta in allCarpetas:
    if not os.path.exists(carpeta):
        print(f"Error: La carpeta de origen {carpeta} no existe.")


# Copia toda la carpeta de origen a la carpeta de destino


for carpeta in carpetas_origen:
    agregar_carpeta = carpeta[carpeta.rfind("/")::]
    shutil.copytree(carpeta, carpeta_destino +
                    agregar_carpeta, dirs_exist_ok=True)
    print(f"La carpeta {carpeta} ha sido copiada a {
          carpeta_destino} exitosamente.")

for archivo in archivos_configuracion:
    agregar_archivo = archivo[archivo.rfind(".")+1::]
    shutil.copytree(carpeta, carpeta_destino +
                    agregar_archivo, dirs_exist_ok=True)
    print(f"El archivo {archivo} ha sido copiada a {
        carpeta_destino} exitosamente.")
