/*
3. Temporalidad
Pregunta: ¿En qué días de la semana los clientes ocasionales utilizan más el servicio frente a los miembros?
- Realizar un conteo de viajes dependiendo de los días de la semana.
¿Por qué? Observar los días de la semana donde los tipos de usuario realizan los viajes.
*/

SELECT
    día_semana,
    SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END) AS viajes_ocasionales,
    (SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Ocasional') as Porcentaje_ocasional,
    SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END) AS viajes_miembros,
    (SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Miembro') as Porcentaje_miembro
FROM viajes_2019
GROUP BY 1,weekday
ORDER BY weekday ASC;



/*
Insights:
-Clientes Ocasionales:
Picos: Domingo y Sábado.
Menor uso: Martes y Miércoles.
Interpretación: Los clientes ocasionales concentran su uso principalmente en fines de semana, lo que sugiere 
que utilizan el servicio para actividades recreativas o turísticas.

-Miembros:
Uso más constante: Los miembros muestran un uso más distribuido a lo largo de la semana, sin picos tan marcados como 
los clientes ocasionales.
Menor uso: Domingo.
Interpretación: Los miembros utilizan el servicio de manera más regular, probablemente para sus desplazamientos diarios.

[
  {
    "día_semana": "Domingo",
    "viajes_ocasionales": "139272",
    "porcentaje_ocasional": "19",
    "viajes_miembros": "217531",
    "porcentaje_miembro": "8"
  },
  {
    "día_semana": "Lunes",
    "viajes_ocasionales": "77444",
    "porcentaje_ocasional": "11",
    "viajes_miembros": "388161",
    "porcentaje_miembro": "15"
  },
  {
    "día_semana": "Martes",
    "viajes_ocasionales": "72260",
    "porcentaje_ocasional": "10",
    "viajes_miembros": "423379",
    "porcentaje_miembro": "17"
  },
  {
    "día_semana": "Miércoles",
    "viajes_ocasionales": "73026",
    "porcentaje_ocasional": "10",
    "viajes_miembros": "417095",
    "porcentaje_miembro": "16"
  },
  {
    "día_semana": "Jueves",
    "viajes_ocasionales": "80882",
    "porcentaje_ocasional": "11",
    "viajes_miembros": "405072",
    "porcentaje_miembro": "16"
  },
  {
    "día_semana": "Viernes",
    "viajes_ocasionales": "97436",
    "porcentaje_ocasional": "13",
    "viajes_miembros": "381406",
    "porcentaje_miembro": "15"
  },
  {
    "día_semana": "Sábado",
    "viajes_ocasionales": "159998",
    "porcentaje_ocasional": "22",
    "viajes_miembros": "233311",
    "porcentaje_miembro": "9"
  }
]
*/