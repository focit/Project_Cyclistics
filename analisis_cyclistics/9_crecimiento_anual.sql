/*
3. Temporalidad
Pregunta: ¿Qué patron de acumulacion y diferencia de mes con mes existe en cada tipo de usuario en los viajes realizados en 2019?
- Realizar la contabilización de viajes mes por mes.
- Analizar el porcentaje de crecimiento en los viajes mes por mes durante el año por tipo de usuario.
¿Por qué? Conocer el crecimiento de usuarios a lo largo del año.
*/

SELECT 
    tipo_usuario,
    mes,
    viajes_realizados,
    LAG(mes) OVER (PARTITION BY tipo_usuario ORDER BY mes) AS mes_previos,
    LAG(viajes_realizados) OVER (PARTITION BY tipo_usuario ORDER BY mes) AS recorridos_mes_previo,
    viajes_realizados - (LAG(viajes_realizados) OVER (PARTITION BY tipo_usuario ORDER BY mes)) AS diferencia,
    ROUND(viajes_realizados* 100.0 / (LAG(viajes_realizados) OVER (PARTITION BY tipo_usuario ORDER BY mes)),2) AS pct_crecimiento
FROM (
    SELECT 
            usertype AS tipo_usuario,
            EXTRACT(month FROM star_time_fecha) AS mes,
            COUNT(*) AS viajes_realizados
        FROM viajes_2019
        GROUP BY usertype, EXTRACT(month FROM star_time_fecha));

/*
Insights:
Patrones Generales: Existe una tendencia alcista, tanto miembros como usuarios ocasionales muestran una tendencia general 
al alza en el número de viajes a lo largo del año, con algunas excepciones.
Estacionalidad: Se observa una clara estacionalidad, con un pico en los meses de verano (junio, julio y agosto) y 
una disminución significativa en los meses de invierno (enero, febrero y diciembre).
Fluctuaciones: Existen fluctuaciones significativas de un mes a otro, especialmente en los usuarios ocasionales.

Análisis por Tipo de Usuario:

-Miembros:
Crecimiento constante: Los miembros muestran un crecimiento más consistente a lo largo del año, con algunas pequeñas 
disminuciones en los meses de invierno.
Estabilidad: El crecimiento porcentual entre meses es relativamente estable, lo que sugiere un uso más 
regular del servicio.

-Usuarios Ocasionales:
Mayor variabilidad: Los usuarios ocasionales muestran una mayor variabilidad en el número de viajes de un mes a otro.
Picos estacionales: Los picos de uso se concentran en los meses de verano, coincidiendo con las vacaciones y el buen 
tiempo.

[
  {
    "tipo_usuario": "Miembro",
    "mes": "1",
    "viajes_realizados": "98670",
    "mes_previos": null,
    "recorridos_mes_previo": null,
    "diferencia": null,
    "pct_crecimiento": null
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "2",
    "viajes_realizados": "93548",
    "mes_previos": "1",
    "recorridos_mes_previo": "98670",
    "diferencia": "-5122",
    "pct_crecimiento": "94.81"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "3",
    "viajes_realizados": "149688",
    "mes_previos": "2",
    "recorridos_mes_previo": "93548",
    "diferencia": "56140",
    "pct_crecimiento": "160.01"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "4",
    "viajes_realizados": "217566",
    "mes_previos": "3",
    "recorridos_mes_previo": "149688",
    "diferencia": "67878",
    "pct_crecimiento": "145.35"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "5",
    "viajes_realizados": "285834",
    "mes_previos": "4",
    "recorridos_mes_previo": "217566",
    "diferencia": "68268",
    "pct_crecimiento": "131.38"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "6",
    "viajes_realizados": "309241",
    "mes_previos": "5",
    "recorridos_mes_previo": "285834",
    "diferencia": "23407",
    "pct_crecimiento": "108.19"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "7",
    "viajes_realizados": "381683",
    "mes_previos": "6",
    "recorridos_mes_previo": "309241",
    "diferencia": "72442",
    "pct_crecimiento": "123.43"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "8",
    "viajes_realizados": "331865",
    "mes_previos": "7",
    "recorridos_mes_previo": "381683",
    "diferencia": "-49818",
    "pct_crecimiento": "86.95"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "10",
    "viajes_realizados": "300751",
    "mes_previos": "8",
    "recorridos_mes_previo": "331865",
    "diferencia": "-31114",
    "pct_crecimiento": "90.62"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "11",
    "viajes_realizados": "158447",
    "mes_previos": "10",
    "recorridos_mes_previo": "300751",
    "diferencia": "-142304",
    "pct_crecimiento": "52.68"
  },
  {
    "tipo_usuario": "Miembro",
    "mes": "12",
    "viajes_realizados": "138662",
    "mes_previos": "11",
    "recorridos_mes_previo": "158447",
    "diferencia": "-19785",
    "pct_crecimiento": "87.51"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "1",
    "viajes_realizados": "4602",
    "mes_previos": null,
    "recorridos_mes_previo": null,
    "diferencia": null,
    "pct_crecimiento": null
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "2",
    "viajes_realizados": "2638",
    "mes_previos": "1",
    "recorridos_mes_previo": "4602",
    "diferencia": "-1964",
    "pct_crecimiento": "57.32"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "3",
    "viajes_realizados": "15923",
    "mes_previos": "2",
    "recorridos_mes_previo": "2638",
    "diferencia": "13285",
    "pct_crecimiento": "603.60"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "4",
    "viajes_realizados": "47744",
    "mes_previos": "3",
    "recorridos_mes_previo": "15923",
    "diferencia": "31821",
    "pct_crecimiento": "299.84"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "5",
    "viajes_realizados": "81624",
    "mes_previos": "4",
    "recorridos_mes_previo": "47744",
    "diferencia": "33880",
    "pct_crecimiento": "170.96"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "6",
    "viajes_realizados": "106566",
    "mes_previos": "5",
    "recorridos_mes_previo": "81624",
    "diferencia": "24942",
    "pct_crecimiento": "130.56"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "7",
    "viajes_realizados": "175632",
    "mes_previos": "6",
    "recorridos_mes_previo": "106566",
    "diferencia": "69066",
    "pct_crecimiento": "164.81"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "8",
    "viajes_realizados": "159395",
    "mes_previos": "7",
    "recorridos_mes_previo": "175632",
    "diferencia": "-16237",
    "pct_crecimiento": "90.76"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "10",
    "viajes_realizados": "71035",
    "mes_previos": "8",
    "recorridos_mes_previo": "159395",
    "diferencia": "-88360",
    "pct_crecimiento": "44.57"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "11",
    "viajes_realizados": "18729",
    "mes_previos": "10",
    "recorridos_mes_previo": "71035",
    "diferencia": "-52306",
    "pct_crecimiento": "26.37"
  },
  {
    "tipo_usuario": "Ocasional",
    "mes": "12",
    "viajes_realizados": "16430",
    "mes_previos": "11",
    "recorridos_mes_previo": "18729",
    "diferencia": "-2299",
    "pct_crecimiento": "87.72"
  }
]
*/