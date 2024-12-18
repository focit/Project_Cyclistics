/*
1. Comportamiento general
Pregunta: ¿Cuáles son los horarios pico para cada tipo de usuario?
- Contablizar la cantidad de viajes realizados según el tipo de usuario.
- Obtener su porcentaje sobre el total de viajes.
- Agrupar los datos en las horas del día para observar las horas pico por cada cliente.
¿Por qué? Conocer las horas del día donde hay una mayor cantidad de recorridos.
*/


SELECT
    EXTRACT(hour From star_time_hora) as hora_del_dia,
    SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END) AS viajes_ocasionales,
    (SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Ocasional') as Porcentaje_ocasional,
    SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END) AS viajes_miembros,
    (SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Miembro') as Porcentaje_miembro
FROM viajes_2019
GROUP BY 1
ORDER BY 1 ASC;

/*
Insights:
-Miembros: Los horarios pico para los miembros parecen concentrarse entre las 6 AM y las 9 AM, y nuevamente entre las 16 PM 
y las 19 PM. Estos horarios coinciden con las horas punta de entrada y salida de los lugares de trabajo, lo que sugiere que 
muchos miembros utilizan las bicicletas para sus desplazamientos diarios.

-Ocasionales: Los clientes ocasionales también presentan un pico en la mañana, pero este se extiende hasta el mediodía. 
Sin embargo, su pico más alto se encuentra entre las 12 PM y las 16 PM, lo que podría indicar que muchos de ellos utilizan 
las bicicletas para actividades de ocio o turismo durante el día.

[
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
*/