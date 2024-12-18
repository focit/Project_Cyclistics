import matplotlib.pyplot as plt
import json

# Datos proporcionados
data = [
  {
    "hora_del_dia": "0",
    "viajes_ocasionales": "6640",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "13186",
    "porcentaje_miembro": "0"
  },
  {
    "hora_del_dia": "1",
    "viajes_ocasionales": "4365",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "7568",
    "porcentaje_miembro": "0"
  },
  {
    "hora_del_dia": "2",
    "viajes_ocasionales": "2667",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "4380",
    "porcentaje_miembro": "0"
  },
  {
    "hora_del_dia": "3",
    "viajes_ocasionales": "1470",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "3023",
    "porcentaje_miembro": "0"
  },
  {
    "hora_del_dia": "4",
    "viajes_ocasionales": "885",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "5515",
    "porcentaje_miembro": "0"
  },
  {
    "hora_del_dia": "5",
    "viajes_ocasionales": "2148",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "28176",
    "porcentaje_miembro": "1"
  },
  {
    "hora_del_dia": "6",
    "viajes_ocasionales": "4779",
    "porcentaje_ocasional": "0",
    "viajes_miembros": "86532",
    "porcentaje_miembro": "3"
  },
  {
    "hora_del_dia": "7",
    "viajes_ocasionales": "10079",
    "porcentaje_ocasional": "1",
    "viajes_miembros": "189485",
    "porcentaje_miembro": "7"
  },
  {
    "hora_del_dia": "8",
    "viajes_ocasionales": "17332",
    "porcentaje_ocasional": "2",
    "viajes_miembros": "241057",
    "porcentaje_miembro": "9"
  },
  {
    "hora_del_dia": "9",
    "viajes_ocasionales": "22662",
    "porcentaje_ocasional": "3",
    "viajes_miembros": "114455",
    "porcentaje_miembro": "4"
  },
  {
    "hora_del_dia": "10",
    "viajes_ocasionales": "35436",
    "porcentaje_ocasional": "5",
    "viajes_miembros": "84155",
    "porcentaje_miembro": "3"
  },
  {
    "hora_del_dia": "11",
    "viajes_ocasionales": "47499",
    "porcentaje_ocasional": "6",
    "viajes_miembros": "100540",
    "porcentaje_miembro": "4"
  },
  {
    "hora_del_dia": "12",
    "viajes_ocasionales": "55449",
    "porcentaje_ocasional": "7",
    "viajes_miembros": "114432",
    "porcentaje_miembro": "4"
  },
  {
    "hora_del_dia": "13",
    "viajes_ocasionales": "59852",
    "porcentaje_ocasional": "8",
    "viajes_miembros": "110539",
    "porcentaje_miembro": "4"
  },
  {
    "hora_del_dia": "14",
    "viajes_ocasionales": "62835",
    "porcentaje_ocasional": "8",
    "viajes_miembros": "107457",
    "porcentaje_miembro": "4"
  },
  {
    "hora_del_dia": "15",
    "viajes_ocasionales": "64476",
    "porcentaje_ocasional": "9",
    "viajes_miembros": "138153",
    "porcentaje_miembro": "5"
  },
  {
    "hora_del_dia": "16",
    "viajes_ocasionales": "66399",
    "porcentaje_ocasional": "9",
    "viajes_miembros": "247034",
    "porcentaje_miembro": "10"
  },
  {
    "hora_del_dia": "17",
    "viajes_ocasionales": "66322",
    "porcentaje_ocasional": "9",
    "viajes_miembros": "327285",
    "porcentaje_miembro": "13"
  },
  {
    "hora_del_dia": "18",
    "viajes_ocasionales": "53020",
    "porcentaje_ocasional": "7",
    "viajes_miembros": "205319",
    "porcentaje_miembro": "8"
  },
  {
    "hora_del_dia": "19",
    "viajes_ocasionales": "40521",
    "porcentaje_ocasional": "5",
    "viajes_miembros": "131808",
    "porcentaje_miembro": "5"
  },
  {
    "hora_del_dia": "20",
    "viajes_ocasionales": "27879",
    "porcentaje_ocasional": "3",
    "viajes_miembros": "83663",
    "porcentaje_miembro": "3"
  },
  {
    "hora_del_dia": "21",
    "viajes_ocasionales": "19912",
    "porcentaje_ocasional": "2",
    "viajes_miembros": "59474",
    "porcentaje_miembro": "2"
  },
  {
    "hora_del_dia": "22",
    "viajes_ocasionales": "16636",
    "porcentaje_ocasional": "2",
    "viajes_miembros": "39595",
    "porcentaje_miembro": "1"
  },
  {
    "hora_del_dia": "23",
    "viajes_ocasionales": "11055",
    "porcentaje_ocasional": "1",
    "viajes_miembros": "23124",
    "porcentaje_miembro": "0"
  }
]

# Preparar datos para los gráficos
horas = [int(item["hora_del_dia"]) for item in data]
viajes_ocasionales = [int(item["viajes_ocasionales"]) for item in data]
viajes_miembros = [int(item["viajes_miembros"]) for item in data]

# Crear gráfico de barras para viajes ocasionales
plt.figure(figsize=(12, 6))
plt.bar(horas, viajes_ocasionales, label='Viajes Ocasionales', color='blue')
plt.title('Frecuencia de Viajes Ocasionales por Hora del Día en el año 2019')
plt.xlabel('Hora del Día')
plt.ylabel('Total de Viajes')
plt.legend()
plt.tight_layout()
plt.show()

# Crear gráfico de barras para viajes de miembros
plt.figure(figsize=(12, 6))
plt.bar(horas, viajes_miembros, label='Viajes Miembros', color='green')
plt.title('Frecuencia de Viajes Miembros por Hora del Día en el año 2019')
plt.xlabel('Hora del Día')
plt.ylabel('Total de Viajes')
plt.legend()
plt.tight_layout()
plt.show()