import requests
from bs4 import BeautifulSoup
import pandas as pd

url = 'https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'lxml')


table = soup.find("table", attrs={"id": "weather_records"})

heading_table = []  # Lista donde se almacenarán los nombres de las columnas

for row in table.find_all(
    'th'
):  # Los nombres de las columnas están dentro de los elementos <th>,
    # así que encontraremos todos los elementos <th> en la tabla y los ejecutaremos en un bucle
    heading_table.append(
        row.text
        # Agrega el contenido de la etiqueta <th> a la lista heading_table usando append()
    )
# print(heading_table)


content = []  # lista donde se almacenarán los datos de la tabla
for row in table.find_all('tr'):
    # Cada fila está envuelta en una etiqueta <tr>, necesitamos recorrer todas las filas
    if not row.find_all('th'):
        # Necesitamos esta condición para ignorar la primera fila de la tabla, con encabezados
        content.append([element.text for element in row.find_all('td')])
        # Dentro de cada fila, el contenido de la celda está envuelto en etiquetas <td> </td>
        # Necesitamos recorrer todos los elementos <td>, extraer el contenido de las celdas y agregarlo a la lista
        # Luego agregamos cada una de las listas a la lista de contenido
# print(content)


weather_records = pd.DataFrame(content, columns=heading_table)
# pasa la lista de contenido bidimensional como datos y heading_table como encabezados
print(weather_records)
