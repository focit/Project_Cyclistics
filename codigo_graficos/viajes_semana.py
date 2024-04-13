import matplotlib.pyplot as plt

# Datos en formato JSON
data = [
    {"weekday": 1, "promedio_recorrido_customer": {"minutes": 42, "seconds": 17}, "promedio_recorrido_subscriber": {"minutes": 14, "seconds": 20}, "total_viajes_customer": 139272, "total_viajes_subscriber": 217531},
    {"weekday": 2, "promedio_recorrido_customer": {"minutes": 39, "seconds": 45,}, "promedio_recorrido_subscriber": {"minutes": 12, "seconds": 35,}, "total_viajes_customer": 77444, "total_viajes_subscriber": 388161},
    {"weekday": 3, "promedio_recorrido_customer": {"minutes": 39, "seconds": 0}, "promedio_recorrido_subscriber": {"minutes": 12, "seconds": 36}, "total_viajes_customer": 72260, "total_viajes_subscriber": 423379},
    {"weekday": 4, "promedio_recorrido_customer": {"minutes": 38, "seconds": 18}, "promedio_recorrido_subscriber": {"minutes": 12, "seconds": 38}, "total_viajes_customer": 73026, "total_viajes_subscriber": 417095},
    {"weekday": 5, "promedio_recorrido_customer": {"minutes": 39, "seconds": 21}, "promedio_recorrido_subscriber": {"minutes": 12, "seconds": 39}, "total_viajes_customer": 80882, "total_viajes_subscriber": 405072},
    {"weekday": 6, "promedio_recorrido_customer": {"minutes": 39, "seconds": 46}, "promedio_recorrido_subscriber": {"minutes": 12, "seconds": 33}, "total_viajes_customer": 97436, "total_viajes_subscriber": 381406},
    {"weekday": 7, "promedio_recorrido_customer": {"minutes": 42, "seconds": 21}, "promedio_recorrido_subscriber": {"minutes": 14, "seconds": 30}, "total_viajes_customer": 159998, "total_viajes_subscriber": 233311}
]

# Diccionario para mapear números de días a nombres
dias_semana_dict = {
    1: 'Domingo',
    2: 'Lunes',
    3: 'Martes',
    4: 'Miércoles',
    5: 'Jueves',
    6: 'Viernes',
    7: 'Sábado'
}

# Extraer los datos
dias_semana = [dias_semana_dict[entry["weekday"]] for entry in data]
viajes_customer = [entry["total_viajes_customer"] for entry in data]
viajes_subscriber = [entry["total_viajes_subscriber"] for entry in data]
tiempo_customer = [entry["promedio_recorrido_customer"]["minutes"] + entry["promedio_recorrido_customer"]["seconds"] / 60 for entry in data]
tiempo_subscriber = [entry["promedio_recorrido_subscriber"]["minutes"] + entry["promedio_recorrido_subscriber"]["seconds"] / 60 for entry in data]

# Crear los gráficos lineales
plt.figure(figsize=(10, 5))

plt.subplot(2, 1, 1)
plt.plot(dias_semana, viajes_customer, marker='o', color='blue')
plt.xlabel('Día de la semana')
plt.ylabel('Total de viajes')
plt.title('Total de viajes de usuarios Customer por día de la semana en 2019')

plt.subplot(2, 1, 2)
plt.plot(dias_semana, viajes_subscriber, marker='o', color='orange')
plt.xlabel('Día de la semana')
plt.ylabel('Total de viajes')
plt.title('Total de viajes de usuarios Subscriber por día de la semana en 2019')

plt.tight_layout()
plt.show()

plt.figure(figsize=(10, 5))

plt.subplot(2, 1, 1)
plt.plot(dias_semana, tiempo_customer, marker='o', color='blue')
plt.xlabel('Día de la semana')
plt.ylabel('Tiempo promedio (Minutos)')
plt.title('Promedio en el tiempo de los recorridos de usuarios Customer por día de la semana en 2019')

plt.subplot(2, 1, 2)
plt.plot(dias_semana, tiempo_subscriber, marker='o', color='orange')
plt.xlabel('Día de la semana')
plt.ylabel('Tiempo promedio (Minutos)')
plt.title('Promedio en el tiempo de los recorridos de usuarios Customer por día de la semana en 2019')

plt.tight_layout()
plt.show()