import matplotlib.pyplot as plt

# Datos en formato JSON
data = [
    {
        "usertype": "Customer",
        "viajes_totales": 700318,
        "recorridos_totales": {"hours": 473709, "minutes": 23, "seconds": 18}
    },
    {
        "usertype": "Subscriber",
        "viajes_totales": 2465955,
        "recorridos_totales": {"hours": 532008, "minutes": 4, "seconds": 4}
    }
]

# Extraer los datos
usertypes = [entry["usertype"] for entry in data]
viajes_totales = [int(entry["viajes_totales"]) for entry in data]
recorridos_totales = [entry["recorridos_totales"]["hours"] + entry["recorridos_totales"]["minutes"] / 60 + entry["recorridos_totales"]["seconds"] / 3600 for entry in data]

# Gráfico de barras para el total de viajes
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.bar(usertypes, viajes_totales, color=['blue', 'orange'])
plt.xlabel('User Type')
plt.ylabel('Total Trips')
plt.title('El total de recorridos realizados en 2019 según el tipo de cliente')

# Gráfico de barras para el tiempo total de recorridos
plt.subplot(1, 2, 2)
plt.bar(usertypes, recorridos_totales, color=['blue', 'orange'])
plt.xlabel('User Type')
plt.ylabel('Total Time (hours)')
plt.title('El tiempo total de los recorridos realizados en 2019 según el tipo de cliente')

# Mostrar los gráficos
plt.tight_layout()
plt.show()