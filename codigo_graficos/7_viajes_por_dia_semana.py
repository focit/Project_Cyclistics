import matplotlib.pyplot as plt

# Datos proporcionados
data = [
    {"día_semana": "Domingo", "viajes_ocasionales": 139272, "porcentaje_ocasional": 19, "viajes_miembros": 217531, "porcentaje_miembro": 8},
    {"día_semana": "Lunes", "viajes_ocasionales": 77444, "porcentaje_ocasional": 11, "viajes_miembros": 388161, "porcentaje_miembro": 15},
    {"día_semana": "Martes", "viajes_ocasionales": 72260, "porcentaje_ocasional": 10, "viajes_miembros": 423379, "porcentaje_miembro": 17},
    {"día_semana": "Miércoles", "viajes_ocasionales": 73026, "porcentaje_ocasional": 10, "viajes_miembros": 417095, "porcentaje_miembro": 16},
    {"día_semana": "Jueves", "viajes_ocasionales": 80882, "porcentaje_ocasional": 11, "viajes_miembros": 405072, "porcentaje_miembro": 16},
    {"día_semana": "Viernes", "viajes_ocasionales": 97436, "porcentaje_ocasional": 13, "viajes_miembros": 381406, "porcentaje_miembro": 15},
    {"día_semana": "Sábado", "viajes_ocasionales": 159998, "porcentaje_ocasional": 22, "viajes_miembros": 233311, "porcentaje_miembro": 9}
]

# Extraer los días de la semana y los valores de los viajes
dias_semana = [entry["día_semana"] for entry in data]
viajes_ocasionales = [entry["viajes_ocasionales"] for entry in data]
viajes_miembros = [entry["viajes_miembros"] for entry in data]
porcentaje_ocasional = [entry["porcentaje_ocasional"] for entry in data]
porcentaje_miembro = [entry["porcentaje_miembro"] for entry in data]

# Gráfico 1: Viajes ocasionales
plt.figure(figsize=(10, 6))
plt.plot(dias_semana, viajes_ocasionales, marker='o', color='b', label='Viajes Ocasionales')
plt.title('Viajes Ocasionales por Día de la Semana en el año 2019')
plt.xlabel('Día de la Semana')
plt.ylabel('Número de Viajes')
plt.legend()

# Colocar el porcentaje como tarjeta en cada punto de "viajes_ocasionales"
for i, (x, y, p) in enumerate(zip(dias_semana, viajes_ocasionales, porcentaje_ocasional)):
    plt.text(x, y, f'{p}%', color='black', ha='center', va='bottom', fontsize=10, fontweight='bold')

# Mostrar el gráfico de viajes ocasionales
plt.tight_layout()
plt.show()

# Gráfico 2: Viajes miembros
plt.figure(figsize=(10, 6))
plt.plot(dias_semana, viajes_miembros, marker='s', color='g', label='Viajes Miembros')
plt.title('Viajes de Miembros por Día de la Semana en el año 2019')
plt.xlabel('Día de la Semana')
plt.ylabel('Número de Viajes')
plt.legend()

# Colocar el porcentaje como tarjeta en cada punto de "viajes_miembros"
for i, (x, y, p) in enumerate(zip(dias_semana, viajes_miembros, porcentaje_miembro)):
    plt.text(x, y, f'{p}%', color='black', ha='center', va='bottom', fontsize=10, fontweight='bold')

# Mostrar el gráfico de viajes miembros
plt.tight_layout()
plt.show()