/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas de acuerdo a la estación que parten su recorrido?
- Realizar un conteo de viajes dependiendo de las estaciones que partieron.
- Agruparlo con el nombre de las estaciones de partida.
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
    from_station_name,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS total_viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS total_viajes_subscriber
FROM 
    viajes_2019_anual
GROUP BY
    from_station_name
ORDER BY
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) DESC
LIMIT 15;

/*
Insights:
- Se observa que hay diferencias significativas en la cantidad de viajes realizados por Customers y 
Subscribers desde diferentes estaciones de partida.
- Algunas estaciones, como "Streeter Dr & Grand Ave" y "Lake Shore Dr & Monroe St", muestran una mayor cantidad 
de viajes realizados por Customers en comparación con Subscribers.
- Las estaciones como "Columbus Dr & Randolph St" y "Michigan Ave & Washington St" registran una cantidad significativamente 
mayor de viajes realizados por Subscribers en comparación con Customers.

Conclusiones:
- Algunas estaciones pueden ser más populares entre los Subscribers debido a su ubicación estratégica o a la disponibilidad 
de rutas preferidas.
- Comprender las preferencias de estación de destino de los diferentes segmentos de usuarios y la ubicación de los mismos puede ser útil para planificar 
estrategias de marketing, analizar las necesidades del cliente dependiendo qué lugares se ubican a los alrededores y colocar anuncios publicitarios en
las estaciones más transitadas por los Customers para que adquieran su mebresia.

[
  {
    "from_station_name": "Streeter Dr & Grand Ave",
    "total_viajes_customer": "41982",
    "total_viajes_subscriber": "12095"
  },
  {
    "from_station_name": "Lake Shore Dr & Monroe St",
    "total_viajes_customer": "31986",
    "total_viajes_subscriber": "8718"
  },
  {
    "from_station_name": "Millennium Park",
    "total_viajes_customer": "17068",
    "total_viajes_subscriber": "10159"
  },
  {
    "from_station_name": "Michigan Ave & Oak St",
    "total_viajes_customer": "17006",
    "total_viajes_subscriber": "11508"
  },
  {
    "from_station_name": "Shedd Aquarium",
    "total_viajes_customer": "16573",
    "total_viajes_subscriber": "4799"
  },
  {
    "from_station_name": "Lake Shore Dr & North Blvd",
    "total_viajes_customer": "15367",
    "total_viajes_subscriber": "12561"
  },
  {
    "from_station_name": "Theater on the Lake",
    "total_viajes_customer": "12022",
    "total_viajes_subscriber": "13926"
  },
  {
    "from_station_name": "Michigan Ave & Washington St",
    "total_viajes_customer": "10444",
    "total_viajes_subscriber": "21373"
  },
  {
    "from_station_name": "Dusable Harbor",
    "total_viajes_customer": "10178",
    "total_viajes_subscriber": "3850"
  },
  {
    "from_station_name": "Adler Planetarium",
    "total_viajes_customer": "9681",
    "total_viajes_subscriber": "4009"
  },
  {
    "from_station_name": "Michigan Ave & 8th St",
    "total_viajes_customer": "7796",
    "total_viajes_subscriber": "4425"
  },
  {
    "from_station_name": "Montrose Harbor",
    "total_viajes_customer": "6596",
    "total_viajes_subscriber": "4351"
  },
  {
    "from_station_name": "Indiana Ave & Roosevelt Rd",
    "total_viajes_customer": "6475",
    "total_viajes_subscriber": "10852"
  },
  {
    "from_station_name": "Columbus Dr & Randolph St",
    "total_viajes_customer": "6306",
    "total_viajes_subscriber": "27008"
  },
  {
    "from_station_name": "Field Museum",
    "total_viajes_customer": "6130",
    "total_viajes_subscriber": "1973"
  }
]
*/