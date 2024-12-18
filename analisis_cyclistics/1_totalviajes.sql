/*
1. Comportamiento general
Pregunta: ¿Cuántos viajes realizan los clientes ocasionales y los miembros?
- Contabilizar el total de recorridos que realizaron los usuarios ocasionales y los miembros.
- Ver el porcentaje de diferencia que hay en cada uno de los tipos de usuario del total de viajes.
¿Por qué? Establecer la diferencia en el uso del servicio de Cyclistics entre los Ocasionales y Miembros en los recorridos realizados en 2019.
*/

SELECT
    usertype AS Tipo_de_usuario,
    Count(*) AS viajes_realizados,
    (SELECT count(*) from viajes_2019) as total_de_viajes,
    Count(*)*100/(SELECT count(*) from viajes_2019) as porcentaje_del_total
FROM
    viajes_2019
GROUP BY 1;

/*
Insights:

-Los miembros de Cyclistics son los principales usuarios del servicio. Realizan casi el 77% del total de viajes. 
Esto indica una alta tasa de adopción y un mayor compromiso con la marca por parte de los miembros.

-Los clientes ocasionales, a pesar de representar un porcentaje menor (22%), también contribuyen significativamente 
al total de viajes. Esto sugiere que Cyclistics tiene una base de clientes ocasionales sólida que podría convertirse 
en miembros potenciales.

[
  {
    "tipo_de_usuario": "Miembro",
    "viajes_realizados": "2465955",
    "total_de_viajes": "3166273",
    "porcentaje_del_total": "77"
  },
  {
    "tipo_de_usuario": "Ocasional",
    "viajes_realizados": "700318",
    "total_de_viajes": "3166273",
    "porcentaje_del_total": "22"
  }
]
*/


