import matplotlib.pyplot as plt
import numpy as np

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

# Crear el gráfico lineal del total de recorridos
plt.figure(figsize=(10, 5))

plt.plot(dias_semana, viajes_customer, marker='o', color='blue', label='Customer')
plt.plot(dias_semana, viajes_subscriber, marker='o', color='orange', label='Subscriber')

# Etiquetas de datos
for i, (semana, vc, vs) in enumerate(zip(dias_semana, viajes_customer, viajes_subscriber)):
    plt.text(semana, vc, f"{vc}", ha='center', va='bottom')
    plt.text(semana, vs, f"{vs}", ha='center', va='bottom')

# Rejillas
plt.grid(True)

plt.xlabel('Mes')
plt.ylabel('Total de viajes')
plt.title('Usuarios Customer vs. Subscriber: Total de viajes por día de la semana en 2019')
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# Crear el gráfico lineal del promedio de tiempo
plt.figure(figsize=(10, 5))

plt.plot(dias_semana, tiempo_customer, marker='o', color='blue', label='Customer')
plt.plot(dias_semana, tiempo_subscriber, marker='o', color='orange', label='Subscriber')

# Etiquetas de datos
for i, (semana, vc, vs) in enumerate(zip(dias_semana, tiempo_customer, tiempo_subscriber)):
    vc_rounded = round(vc, 2)
    vs_rounded = round(vs, 2)
    plt.text(semana, vc, f"{vc_rounded}", ha='center', va='bottom')
    plt.text(semana, vs, f"{vs_rounded}", ha='center', va='bottom')
    
    #plt.text(semana, vc, f"{vc}", ha='center', va='bottom')
    #plt.text(semana, vs, f"{vs}", ha='center', va='bottom')

# Rejillas
plt.grid(True)

plt.xlabel('Dia de la semana')
plt.ylabel('Promedio de tiempo (minutos)')
plt.title('Usuarios Customer vs. Subscriber: Promedio de recorrido por día de la semana en 2019')
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
