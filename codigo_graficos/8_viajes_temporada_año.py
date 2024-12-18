import matplotlib.pyplot as plt

# Datos proporcionados
data = [
    {"estación_del_año": "Invierno", "viajes_ocasionales": 23670, "porcentaje_ocasional": 3, "viajes_miembros": 330880, "porcentaje_miembro": 13},
    {"estación_del_año": "Otoño", "viajes_ocasionales": 89764, "porcentaje_ocasional": 12, "viajes_miembros": 459198, "porcentaje_miembro": 18},
    {"estación_del_año": "Primavera", "viajes_ocasionales": 145291, "porcentaje_ocasional": 20, "viajes_miembros": 653088, "porcentaje_miembro": 26},
    {"estación_del_año": "Verano", "viajes_ocasionales": 441593, "porcentaje_ocasional": 63, "viajes_miembros": 1022789, "porcentaje_miembro": 41}
]

# Extraer los datos para los gráficos
estaciones = [entry["estación_del_año"] for entry in data]
viajes_ocasionales = [entry["viajes_ocasionales"] for entry in data]
porcentaje_ocasional = [entry["porcentaje_ocasional"] for entry in data]
viajes_miembros = [entry["viajes_miembros"] for entry in data]
porcentaje_miembro = [entry["porcentaje_miembro"] for entry in data]

# Crear una figura y dos subgráficos
fig, axes = plt.subplots(1, 2, figsize=(14, 6))

# Gráfico para viajes ocasionales
bars_ocasionales = axes[0].bar(estaciones, viajes_ocasionales, color='orange', edgecolor='black')

# Añadir etiquetas con los porcentajes para viajes ocasionales
for bar, porcentaje in zip(bars_ocasionales, porcentaje_ocasional):
    yval = bar.get_height()
    axes[0].text(bar.get_x() + bar.get_width() / 2, yval + 2000, f'{porcentaje}%', ha='center', va='bottom')

axes[0].set_title('Viajes realizados por Clientes Ocasionales por Estación del año 2019')
axes[0].set_xlabel('Estación del Año')
axes[0].set_ylabel('Número de Viajes Ocasionales')

# Gráfico para viajes de miembros
bars_miembros = axes[1].bar(estaciones, viajes_miembros, color='blue', edgecolor='black')

# Añadir etiquetas con los porcentajes para viajes de miembros
for bar, porcentaje in zip(bars_miembros, porcentaje_miembro):
    yval = bar.get_height()
    axes[1].text(bar.get_x() + bar.get_width() / 2, yval + 2000, f'{porcentaje}%', ha='center', va='bottom')

axes[1].set_title('Viajes realizados por Miembros por Estación del año 2019')
axes[1].set_xlabel('Estación del Año')
axes[1].set_ylabel('Número de Viajes Miembros')

# Ajustar el espacio entre los gráficos y mostrar
plt.tight_layout()
plt.show()