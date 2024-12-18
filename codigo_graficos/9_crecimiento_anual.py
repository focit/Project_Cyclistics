import matplotlib.pyplot as plt

# Datos proporcionados
data = [
    {"tipo_usuario": "Miembro", "mes": "Enero", "viajes_realizados": 98670, "pct_crecimiento": None},
    {"tipo_usuario": "Miembro", "mes": "Febrero", "viajes_realizados": 93548, "pct_crecimiento": 94.81},
    {"tipo_usuario": "Miembro", "mes": "Marzo", "viajes_realizados": 149688, "pct_crecimiento": 160.01},
    {"tipo_usuario": "Miembro", "mes": "Abril", "viajes_realizados": 217566, "pct_crecimiento": 145.35},
    {"tipo_usuario": "Miembro", "mes": "Mayo", "viajes_realizados": 285834, "pct_crecimiento": 131.38},
    {"tipo_usuario": "Miembro", "mes": "Junio", "viajes_realizados": 309241, "pct_crecimiento": 108.19},
    {"tipo_usuario": "Miembro", "mes": "Julio", "viajes_realizados": 381683, "pct_crecimiento": 123.43},
    {"tipo_usuario": "Miembro", "mes": "Agosto", "viajes_realizados": 331865, "pct_crecimiento": 86.95},
    {"tipo_usuario": "Miembro", "mes": "Octubre", "viajes_realizados": 300751, "pct_crecimiento": 90.62},
    {"tipo_usuario": "Miembro", "mes": "Noviembre", "viajes_realizados": 158447, "pct_crecimiento": 52.68},
    {"tipo_usuario": "Miembro", "mes": "Diciembre", "viajes_realizados": 138662, "pct_crecimiento": 87.51},
    {"tipo_usuario": "Ocasional", "mes": "Enero", "viajes_realizados": 4602, "pct_crecimiento": None},
    {"tipo_usuario": "Ocasional", "mes": "Febrero", "viajes_realizados": 2638, "pct_crecimiento": 57.32},
    {"tipo_usuario": "Ocasional", "mes": "Marzo", "viajes_realizados": 15923, "pct_crecimiento": 603.60},
    {"tipo_usuario": "Ocasional", "mes": "Abril", "viajes_realizados": 47744, "pct_crecimiento": 299.84},
    {"tipo_usuario": "Ocasional", "mes": "Mayo", "viajes_realizados": 81624, "pct_crecimiento": 170.96},
    {"tipo_usuario": "Ocasional", "mes": "Junio", "viajes_realizados": 106566, "pct_crecimiento": 130.56},
    {"tipo_usuario": "Ocasional", "mes": "Julio", "viajes_realizados": 175632, "pct_crecimiento": 164.81},
    {"tipo_usuario": "Ocasional", "mes": "Agosto", "viajes_realizados": 159395, "pct_crecimiento": 90.76},
    {"tipo_usuario": "Ocasional", "mes": "Octubre", "viajes_realizados": 71035, "pct_crecimiento": 44.57},
    {"tipo_usuario": "Ocasional", "mes": "Noviembre", "viajes_realizados": 18729, "pct_crecimiento": 26.37},
    {"tipo_usuario": "Ocasional", "mes": "Diciembre", "viajes_realizados": 16430, "pct_crecimiento": 87.72},
]

# Filtrar datos por tipo de usuario
data_miembro = [entry for entry in data if entry["tipo_usuario"] == "Miembro"]
data_ocasional = [entry for entry in data if entry["tipo_usuario"] == "Ocasional"]

# Extraer los valores de mes, viajes realizados y pct_crecimiento
meses_miembro = [entry["mes"] for entry in data_miembro]
viajes_miembro = [entry["viajes_realizados"] for entry in data_miembro]
pct_crecimiento_miembro = [entry["pct_crecimiento"] for entry in data_miembro]

meses_ocasional = [entry["mes"] for entry in data_ocasional]
viajes_ocasional = [entry["viajes_realizados"] for entry in data_ocasional]
pct_crecimiento_ocasional = [entry["pct_crecimiento"] for entry in data_ocasional]

# Gráfico 1: Viajes realizados por Miembros
plt.figure(figsize=(12, 6))
plt.plot(meses_miembro, viajes_miembro, marker='o', color='b', label='Viajes Miembros')
plt.title('Crecimiento en la cantidad de Viajes de Miembros con respecto al mes anterior del año 2019')
plt.xlabel('Mes')
plt.ylabel('Número de Viajes Realizados')
plt.legend()

# Colocar el porcentaje de crecimiento como etiqueta en cada punto de "viajes_miembro"
for i, (x, y, p) in enumerate(zip(meses_miembro, viajes_miembro, pct_crecimiento_miembro)):
    if p is not None:
        label = f'{p:.2f}%' if p >= 0 else f'{p:.2f}%'
        plt.text(x, y, label, color='black', ha='center', va='bottom', fontsize=10, fontweight='bold')

# Mostrar gráfico de miembros
plt.tight_layout()
plt.show()

# Gráfico 2: Viajes realizados por Ocacionales
plt.figure(figsize=(12, 6))
plt.plot(meses_ocasional, viajes_ocasional, marker='s', color='g', label='Viajes Ocacionales')
plt.title('Crecimiento en la cantidad de Viajes Ocasionales con respecto al mes anterior del año 2019')
plt.xlabel('Mes')
plt.ylabel('Número de Viajes Realizados')
plt.legend()

# Colocar el porcentaje de crecimiento como etiqueta en cada punto de "viajes_ocasional"
for i, (x, y, p) in enumerate(zip(meses_ocasional, viajes_ocasional, pct_crecimiento_ocasional)):
    if p is not None:
        label = f'{p:.2f}%' if p >= 0 else f'{p:.2f}%'
        plt.text(x, y, label, color='black', ha='center', va='bottom', fontsize=10, fontweight='bold')

# Mostrar gráfico de ocasionales
plt.tight_layout()
plt.show()