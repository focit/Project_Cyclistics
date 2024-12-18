import matplotlib.pyplot as plt
import json

# Datos en formato JSON
data = [
    {
        "tipo_de_usuario": "Miembro",
        "viajes_realizados": "2465955",
        "total_de_viajes": "3166273",
        "porcentaje_del_total": "77"
    },
    {
        "tipo_de_usuario": "Ocasional",
        "viajes_realizados": "700318",
        "total_de_viajes": "3166273",
        "porcentaje_del_total": "22"
    }
]

# Procesar los datos
tipos = [item["tipo_de_usuario"] for item in data]
porcentajes = [float(item["porcentaje_del_total"]) for item in data]
viajes_realizados = [int(item["viajes_realizados"]) for item in data]

# Crear etiquetas para el gráfico
etiquetas = [
    f"{tipo}\nViajes: {viajes}\nPorcentaje: {porcentaje}%"
    for tipo, viajes, porcentaje in zip(tipos, viajes_realizados, porcentajes)
]

# Crear gráfico de pastel
plt.figure(figsize=(8, 6))
plt.pie(
    porcentajes,
    labels=etiquetas,
    autopct='%1.1f%%',
    startangle=90,
    colors=['#66c2a5', '#fc8d62'],
    wedgeprops={"edgecolor": "white"}
)

# Título del gráfico
plt.title("Distribución de Viajes Realizados por Tipo de Usuario en el año 2o19")

# Mostrar gráfico
plt.show()