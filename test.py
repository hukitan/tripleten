import numpy as np

# Crea los vectores x e y
y = [28.1, 18.7, 1.0, 10.2, 11.6, 19.9, 24.4, 18.1, 18.5, 25.0, 21.8, 13.4, 18.0, 11.1, 21.1]
x = [12, 9, 4, 5, 5, 7, 7, 6, 7, 11, 9, 8, 10, 4, 11]

y_1 = [(2 + 2*i) for i in x]
y_2 = [(3 + 1*i) for i  in x]
print('Pronóstico realizado por el primer modelo:', y_1)
print('Pronóstico realizado por el segundo modelo:', y_2)