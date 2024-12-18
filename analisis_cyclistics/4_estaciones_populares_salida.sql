/*
2. Uso geográfico
Pregunta: ¿Cuáles son las estaciones de salida más populares para cada usuario?
- Contabilizar la cantidad de viajes que se realizaron  en cada estación.
- Elegir los mejores 10.
¿Por qué? Analizar cuáles son las estaciones donde salen la mayor cantidad de recorridos para clientes ocasionales y miembros.
*/

--Top 10 estaciones de salida para Clientes ocasionales

SELECT
    from_station_name AS estación,
    count(*) as viajes_ocasionales
FROM viajes_2019
GROUP BY 1,usertype
HAVING usertype = 'Ocasional'
ORDER BY 2 DESC
LIMIT 10;


--Top 10 estaciones de salida para Miembros

SELECT
    from_station_name AS estación,
    count(*) As viajes_miembros
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

*Top 10 estaciones de salida para Clientes ocasionales
[
  {
    "estación": "Streeter Dr & Grand Ave",
    "viajes_ocasionales": "41982"
  },
  {
    "estación": "Lake Shore Dr & Monroe St",
    "viajes_ocasionales": "31986"
  },
  {
    "estación": "Millennium Park",
    "viajes_ocasionales": "17068"
  },
  {
    "estación": "Michigan Ave & Oak St",
    "viajes_ocasionales": "17006"
  },
  {
    "estación": "Shedd Aquarium",
    "viajes_ocasionales": "16573"
  },
  {
    "estación": "Lake Shore Dr & North Blvd",
    "viajes_ocasionales": "15367"
  },
  {
    "estación": "Theater on the Lake",
    "viajes_ocasionales": "12022"
  },
  {
    "estación": "Michigan Ave & Washington St",
    "viajes_ocasionales": "10444"
  },
  {
    "estación": "Dusable Harbor",
    "viajes_ocasionales": "10178"
  },
  {
    "estación": "Adler Planetarium",
    "viajes_ocasionales": "9681"
  }
]
*Top 10 estaciones de salida para Miembros
[
  {
    "estación": "Canal St & Adams St",
    "viajes_miembros": "43032"
  },
  {
    "estación": "Clinton St & Washington Blvd",
    "viajes_miembros": "39036"
  },
  {
    "estación": "Clinton St & Madison St",
    "viajes_miembros": "38925"
  },
  {
    "estación": "Columbus Dr & Randolph St",
    "viajes_miembros": "27008"
  },
  {
    "estación": "Kingsbury St & Kinzie St",
    "viajes_miembros": "26078"
  },
  {
    "estación": "Franklin St & Monroe St",
    "viajes_miembros": "25945"
  },
  {
    "estación": "Daley Center Plaza",
    "viajes_miembros": "25075"
  },
  {
    "estación": "Canal St & Madison St",
    "viajes_miembros": "23305"
  },
  {
    "estación": "Michigan Ave & Washington St",
    "viajes_miembros": "21373"
  },
  {
    "estación": "LaSalle St & Jackson Blvd",
    "viajes_miembros": "19425"
  }
]
*/