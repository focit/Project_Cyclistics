/*
3. Temporalidad
Pregunta: ¿Como es el uso entre estaciones o temporada del año?
- Realizar un conteo de viajes dependiendo de las estaciones que llegaron.
- Agrupar los meses en estaciones del año.
¿Por qué? Observar el uso del servicio en cada temporada anual.
*/

SELECT
    CASE WHEN Month IN (12,1,2) THEN 'Invierno'
        WHEN Month IN (3,4,5) THEN 'Primavera'
        WHEN Month IN (6,7,8) THEN 'Verano'
        WHEN Month IN (9,10,11) THEN 'Otoño'
        END as Estación_del_año,
    SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END) AS viajes_ocasionales,
    (SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Ocasional') AS Porcentaje_ocasional,
    SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END) AS viajes_miembros,
    (SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END))*100/(SELECT count(*) FROM viajes_2019 WHERE usertype = 'Miembro') AS Porcentaje_miembro
FROM 
    viajes_2019
GROUP BY
    1;


/*
Insights:
-Invierno: Tanto los clientes ocasionales como los miembros muestran un uso significativamente menor durante el invierno. 
Esto puede deberse a condiciones climáticas adversas como frío, lluvia o nieve, que desalientan el uso de bicicletas.
-Otoño: Hay un ligero aumento en el uso comparado con el invierno, pero aún se encuentra por debajo de las otras estaciones.
-Primavera: Se observa un incremento considerable en el uso, tanto para clientes ocasionales como para miembros. 
Esto podría deberse a la mejora de las condiciones climáticas y a la mayor disposición de las personas a realizar 
actividades al aire libre.
-Verano: Es la estación con mayor uso, tanto en términos absolutos como relativos. El buen clima y las vacaciones 
favorecen el uso de bicicletas para actividades recreativas y turismo.

[
  {
    "estación_del_año": "Invierno",
    "viajes_ocasionales": "23670",
    "porcentaje_ocasional": "3",
    "viajes_miembros": "330880",
    "porcentaje_miembro": "13"
  },
  {
    "estación_del_año": "Otoño",
    "viajes_ocasionales": "89764",
    "porcentaje_ocasional": "12",
    "viajes_miembros": "459198",
    "porcentaje_miembro": "18"
  },
  {
    "estación_del_año": "Primavera",
    "viajes_ocasionales": "145291",
    "porcentaje_ocasional": "20",
    "viajes_miembros": "653088",
    "porcentaje_miembro": "26"
  },
  {
    "estación_del_año": "Verano",
    "viajes_ocasionales": "441593",
    "porcentaje_ocasional": "63",
    "viajes_miembros": "1022789",
    "porcentaje_miembro": "41"
  }
]
*/