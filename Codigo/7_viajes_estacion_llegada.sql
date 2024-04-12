/*
Pregunta: ¿¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas de acuerdo a la estación que concluyen su recorrido?
- Realizar un conteo de viajes dependiendo de las estaciones que llegaron.
- Agruparlo con el nombre de las estaciones que llegaron.
¿Por qué? Observar las estaciones más utilizadas por cada tipo de usuario.
*/

WITH viajes_2019_anual AS (
SELECT * FROM viajes_2019_ene_mar
UNION ALL
SELECT * FROM viajes_2019_abr_jun
UNION ALL
SELECT * FROM viajes_2019_jul_sep
UNION ALL
SELECT * FROM viajes_2019_oct_dic
)

SELECT
    to_station_name,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS total_viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS total_viajes_suscriber
FROM 
    viajes_2019_anual
GROUP BY
    to_station_name
ORDER BY
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) DESC
LIMIT 15;

/*
Insights:
- Se observa que hay diferencias significativas en la cantidad de viajes realizados por Customers y 
Subscribers hacia diferentes estaciones de llegada.
- Algunas estaciones, como "Streeter Dr & Grand Ave" y "Lake Shore Dr & Monroe St", registran una mayor cantidad de viajes 
realizados por Customers en comparación con Subscribers.
- Por otro lado, estaciones como "Michigan Ave & Washington St" y "Lake Shore Dr & North Blvd" muestran una cantidad 
significativamente mayor de viajes realizados por Subscribers en comparación con Customers.

Conclusiones:
- Algunas estaciones pueden ser más populares entre los Subscribers debido a su ubicación estratégica o a la disponibilidad de rutas preferidas.
- Comprender las preferencias de estación de destino de los diferentes segmentos de usuarios y la ubicación de los mismos puede ser útil para planificar 
estrategias de marketing, analizar las necesidades del cliente dependiendo qué lugares se ubican a los alrededores y colocar anuncios publicitarios en
las estaciones más transitadas por los Customers para que adquieran su mebresia.

[
  {
    "to_station_name": "Streeter Dr & Grand Ave",
    "total_viajes_customer": "53797",
    "total_viajes_suscriber": "11499"
  },
  {
    "to_station_name": "Lake Shore Dr & Monroe St",
    "total_viajes_customer": "25218",
    "total_viajes_suscriber": "8267"
  },
  {
    "to_station_name": "Millennium Park",
    "total_viajes_customer": "19972",
    "total_viajes_suscriber": "10125"
  },
  {
    "to_station_name": "Michigan Ave & Oak St",
    "total_viajes_customer": "18830",
    "total_viajes_suscriber": "11629"
  },
  {
    "to_station_name": "Lake Shore Dr & North Blvd",
    "total_viajes_customer": "18809",
    "total_viajes_suscriber": "15261"
  },
  {
    "to_station_name": "Theater on the Lake",
    "total_viajes_customer": "15238",
    "total_viajes_suscriber": "14127"
  },
  {
    "to_station_name": "Shedd Aquarium",
    "total_viajes_customer": "13280",
    "total_viajes_suscriber": "4738"
  },
  {
    "to_station_name": "Michigan Ave & Washington St",
    "total_viajes_customer": "10468",
    "total_viajes_suscriber": "23931"
  },
  {
    "to_station_name": "Adler Planetarium",
    "total_viajes_customer": "8652",
    "total_viajes_suscriber": "4002"
  },
  {
    "to_station_name": "Dusable Harbor",
    "total_viajes_customer": "7782",
    "total_viajes_suscriber": "3956"
  },
  {
    "to_station_name": "Michigan Ave & 8th St",
    "total_viajes_customer": "7689",
    "total_viajes_suscriber": "3525"
  },
  {
    "to_station_name": "Montrose Harbor",
    "total_viajes_customer": "6244",
    "total_viajes_suscriber": "4487"
  },
  {
    "to_station_name": "Indiana Ave & Roosevelt Rd",
    "total_viajes_customer": "6044",
    "total_viajes_suscriber": "10835"
  },
  {
    "to_station_name": "Clark St & Armitage Ave",
    "total_viajes_customer": "5862",
    "total_viajes_suscriber": "12616"
  },
  {
    "to_station_name": "Wabash Ave & Grand Ave",
    "total_viajes_customer": "5772",
    "total_viajes_suscriber": "14539"
  }
]
*/