/*
2. Uso geográfico
Pregunta: ¿Cuáles son las estaciones de llegada más populares para cada usuario?
- Utilizar la tabla con los recorridos totales del año.
- Contabilizar la cantidad de viajes que se realizaron  en cada estación.
- Elegir los mejores 10.
¿Por qué? Analizar cuáles son las estaciones donde llegan la mayor cantidad de recorridos para clientes ocasionales y miembros.
*/

--Top 10 estaciones de llegada para Clientes ocasionales

SELECT
    to_station_name AS estación,
    count(*) as viajes_ocasionales
FROM viajes_2019
GROUP BY 1,usertype
HAVING usertype = 'Ocasional'
ORDER BY 2 DESC
LIMIT 10;

--Top 10 estaciones de llegada para Miembros

SELECT
    to_station_name AS estación,
    count(*) As viajes_miembro
FROM viajes_2019
GROUP BY 1,usertype
HAVING usertype = 'Miembro'
ORDER BY 2 DESC
LIMIT 10;

/*
Insights:
-Los clientes ocasionales muestran una preferencia por estaciones ubicadas en zonas turísticas o con alta visibilidad, como:
1. Frente al lago Michigan: Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St, Lake Shore Dr & North Blvd, Shedd Aquarium, 
Theater on the Lake.
2. Centros turísticos: Millennium Park, Michigan Ave & Oak St.
Esta preferencia sugiere que los clientes ocasionales utilizan las bicicletas principalmente para fines recreativos o
turísticos, explorando los lugares más emblemáticos de la ciudad.

-Por su parte, los miembros muestran una preferencia por estaciones ubicadas en zonas más céntricas y con alta densidad de 
oficinas, como:
1. Distrito financiero: Canal St & Adams St, Clinton St & Washington Blvd, Clinton St & Madison St, Columbus Dr & Randolph St, 
Franklin St & Monroe St, Daley Center Plaza, Canal St & Madison St, LaSalle St & Jackson Blvd.
2. Esta preferencia indica que los miembros utilizan las bicicletas principalmente para sus desplazamientos diarios, ya sea para ir 
al trabajo, hacer recados o realizar otras actividades en el centro de la ciudad.

*Top 10 estaciones de llegada para Clientes ocasionales
[
  {
    "estación": "Streeter Dr & Grand Ave",
    "viajes_ocasionales": "53797"
  },
  {
    "estación": "Lake Shore Dr & Monroe St",
    "viajes_ocasionales": "25218"
  },
  {
    "estación": "Millennium Park",
    "viajes_ocasionales": "19972"
  },
  {
    "estación": "Michigan Ave & Oak St",
    "viajes_ocasionales": "18830"
  },
  {
    "estación": "Lake Shore Dr & North Blvd",
    "viajes_ocasionales": "18809"
  },
  {
    "estación": "Theater on the Lake",
    "viajes_ocasionales": "15238"
  },
  {
    "estación": "Shedd Aquarium",
    "viajes_ocasionales": "13280"
  },
  {
    "estación": "Michigan Ave & Washington St",
    "viajes_ocasionales": "10468"
  },
  {
    "estación": "Adler Planetarium",
    "viajes_ocasionales": "8652"
  },
  {
    "estación": "Dusable Harbor",
    "viajes_ocasionales": "7782"
  }
]
*Top 10 estaciones de llegada para Miembros
[
  {
    "estación": "Clinton St & Washington Blvd",
    "viajes_miembro": "41214"
  },
  {
    "estación": "Canal St & Adams St",
    "viajes_miembro": "40771"
  },
  {
    "estación": "Clinton St & Madison St",
    "viajes_miembro": "37897"
  },
  {
    "estación": "Kingsbury St & Kinzie St",
    "viajes_miembro": "25743"
  },
  {
    "estación": "Daley Center Plaza",
    "viajes_miembro": "25515"
  },
  {
    "estación": "Michigan Ave & Washington St",
    "viajes_miembro": "23931"
  },
  {
    "estación": "Canal St & Madison St",
    "viajes_miembro": "22745"
  },
  {
    "estación": "Franklin St & Monroe St",
    "viajes_miembro": "22323"
  },
  {
    "estación": "Clark St & Elm St",
    "viajes_miembro": "18745"
  },
  {
    "estación": "LaSalle St & Jackson Blvd",
    "viajes_miembro": "18735"
  }
]
*/
