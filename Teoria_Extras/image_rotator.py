# image_rotator.py

from PIL import Image
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('input_file', help='ruta del archivo de entrada')
parser.add_argument('output_file', help='ruta del archivo de salida')
parser.add_argument('angle', help='rotación deseada', type=int)
parser.add_argument( '-i', '--info', help='muestra el tamaño de la imagen', action='store_true')
args = parser.parse_args()

angle = args.angle

try:
    im = Image.open(args.input_file)
    
except FileNotFoundError:
    print('archivo de entrada no encontrado, introduce el nombre de archivo correcto:')
    im = Image.open(input())

except Exception:
    print('Archivo incorrecto, intenta con uno diferente:')
    im = Image.open(input())

else:
    print("Ejecución fluida'")

finally:
    rotated = im.rotate(angle)
    im.close() # cerrar el archivo de imagen, eliminándolo de la memoria
    rotated.save(args.output_file)

if args.info:
    print('dimensiones de la imagen de entrada:', im.size)