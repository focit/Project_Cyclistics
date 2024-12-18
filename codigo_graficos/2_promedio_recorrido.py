import matplotlib.pyplot as plt
import json

# Datos en formato JSON

data_bar = [
    {
        "usertype": "Miembro",
        "promedio_viaje_min": "14.24"
    },
    {
        "usertype": "Ocasional",
        "promedio_viaje_min": "58.44"
    }
]


# Procesar los datos para el gráfico de barras
usertypes = [item["usertype"] for item in data_bar]
promedios = [float(item["promedio_viaje_min"]) for item in data_bar]

# Crear gráfico de barras
plt.figure(figsize=(8, 6))
bars = plt.bar(
    usertypes, 
    promedios, 
    color=['#66c2a5', '#fc8d62'], 
    edgecolor="black"
)

# Añadir etiquetas encima de las barras
for bar, promedio in zip(bars, promedios):
    plt.text(
        bar.get_x() + bar.get_width() / 2, 
        bar.get_height(), 
        f"{promedio} min", 
        ha='center', 
        va='bottom', 
        fontsize=10
    )

# Añadir etiquetas y título
plt.xlabel("Tipo de Usuario")
plt.ylabel("Promedio de Viaje (min)")
plt.title("Promedio de Recorrido (Min) por Tipo de Usuario en el año 2019")

# Mostrar gráfico
plt.show()


