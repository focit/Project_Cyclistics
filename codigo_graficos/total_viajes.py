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

# Etiquetas de datos
for i, v in enumerate(viajes_totales):
    plt.text(i, v, str(v), ha='center', va='bottom')

plt.xlabel('Tipo de usuario')
plt.ylabel('Total de viajes')
plt.title('Usuarios Customer vs. Subscriber: Total de viajes realizados en 2019')

# Gráfico de barras para el tiempo total de recorridos
plt.subplot(1, 2, 2)
plt.bar(usertypes, recorridos_totales, color=['blue', 'orange'])

# Etiquetas de datos
for i, v in enumerate(recorridos_totales):
    plt.text(i, v, f"{v:.2f}", ha='center', va='bottom')

plt.xlabel('Tipo de usuario')
plt.ylabel('Tiempo total de los recorridos (Horas)')
plt.title('Usuarios Customer vs. Subscriber: Total del tiempo de los recorridos en 2019')

plt.tight_layout()
plt.show()