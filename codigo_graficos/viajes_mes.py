import matplotlib.pyplot as plt

# Datos en formato JSON
data = [
    {"month": 1, "total_viajes_customer": "4602", "total_viajes_subscriber": "98670"},
    {"month": 2, "total_viajes_customer": "2638", "total_viajes_subscriber": "93548"},
    {"month": 3, "total_viajes_customer": "15923", "total_viajes_subscriber": "149688"},
    {"month": 4, "total_viajes_customer": "47744", "total_viajes_subscriber": "217566"},
    {"month": 5, "total_viajes_customer": "81624", "total_viajes_subscriber": "285834"},
    {"month": 6, "total_viajes_customer": "106566", "total_viajes_subscriber": "309241"},
    {"month": 7, "total_viajes_customer": "175632", "total_viajes_subscriber": "381683"},
    {"month": 8, "total_viajes_customer": "159395", "total_viajes_subscriber": "331865"},
    {"month": 10, "total_viajes_customer": "71035", "total_viajes_subscriber": "300751"},
    {"month": 11, "total_viajes_customer": "18729", "total_viajes_subscriber": "158447"},
    {"month": 12, "total_viajes_customer": "16430", "total_viajes_subscriber": "138662"}
]

# Diccionario para mapear números de meses a nombres
meses_dict = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre'
}

# Extraer los datos
meses = [meses_dict[entry["month"]] for entry in data]
viajes_customer = [int(entry["total_viajes_customer"]) for entry in data]
viajes_subscriber = [int(entry["total_viajes_subscriber"]) for entry in data]

# Crear el gráfico lineal
plt.figure(figsize=(10, 5))

plt.plot(meses, viajes_customer, marker='o', color='blue', label='Customer')
plt.plot(meses, viajes_subscriber, marker='o', color='orange', label='Subscriber')

plt.xlabel('Mes')
plt.ylabel('Total de viajes')
plt.title('El total de viajes mensuales realizados por usuarios Customer y Subscriber en el 2019')
plt.legend()

plt.xticks(rotation=45)  # Rotar las etiquetas del eje x para una mejor legibilidad

plt.tight_layout()
plt.show()