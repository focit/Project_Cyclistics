/*
2. Uso geográfico
Pregunta: ¿Existen patrones en los puntos de salida y llegada que difiere entre los clientes ocasionales y miembros?
¿Por qué? Conocer estaciones clave y rutas populares que ayuden a comprender el comportamiento de los usuarios.
*/

---Top 10 rutas realizadas por Clientes Ocasionales

SELECT
    from_station_name || '-' || to_station_name AS ruta_viaje_ocasional,
    count(*) viajes_realizados,
    ROUND(avg(trip_duration/60),2) AS promedio_recorrido
FROM viajes_2019
GROUP BY usertype,from_station_name,to_station_name
HAVING usertype = 'Ocasional'
ORDER BY 2 DESC
LIMIT 10;

---Top 10 rutas realizadas por Miembros

SELECT
    from_station_name || '-' || to_station_name AS ruta_viaje_miembro,
    count(*) viajes_realizados,
    ROUND(avg(trip_duration/60),2) AS promedio_recorrido
FROM viajes_2019
GROUP BY usertype,from_station_name,to_station_name
HAVING usertype = 'Miembro'
ORDER BY 2 DESC
LIMIT 10;

/*
Insights:
Al analizar los datos de las rutas más populares para cada tipo de usuario, podemos identificar los siguientes patrones:

-Clientes Ocasionales: Predominan las rutas que conectan puntos de interés turístico, como el lago Michigan y parques.
Rutas circulares: Muchos clientes ocasionales inician y terminan sus viajes en la misma estación, sugiriendo un uso 
recreativo o exploratorio de la ciudad.
Distancias más largas: En general, los clientes ocasionales realizan viajes más largos, lo que se refleja en el promedio 
de recorrido.

-Miembros: Rutas de desplazamiento: Las rutas más populares conectan estaciones ubicadas en zonas comerciales y de oficinas, 
lo que indica que los miembros utilizan las bicicletas principalmente para sus desplazamientos diarios.
Rutas cortas: La mayoría de las rutas de los miembros son cortas, lo que sugiere que se utilizan para conectar diferentes 
puntos dentro de un área relativamente pequeña.
Estaciones centrales: Muchas rutas convergen en estaciones ubicadas en el centro de la ciudad, lo que indica que estas 
estaciones sirven como puntos de transferencia entre diferentes modos de transporte.

*Top 10 rutas realizadas por Clientes Ocasionales
[
  {
    "ruta_viaje_ocasional": "Lake Shore Dr & Monroe St-Streeter Dr & Grand Ave",
    "viajes_realizados": "7583",
    "promedio_recorrido": "31.16"
  },
  {
    "ruta_viaje_ocasional": "Streeter Dr & Grand Ave-Streeter Dr & Grand Ave",
    "viajes_realizados": "6964",
    "promedio_recorrido": "54.49"
  },
  {
    "ruta_viaje_ocasional": "Lake Shore Dr & Monroe St-Lake Shore Dr & Monroe St",
    "viajes_realizados": "6723",
    "promedio_recorrido": "45.94"
  },
  {
    "ruta_viaje_ocasional": "Michigan Ave & Oak St-Michigan Ave & Oak St",
    "viajes_realizados": "3974",
    "promedio_recorrido": "60.50"
  },
  {
    "ruta_viaje_ocasional": "Shedd Aquarium-Streeter Dr & Grand Ave",
    "viajes_realizados": "2868",
    "promedio_recorrido": "33.68"
  },
  {
    "ruta_viaje_ocasional": "Streeter Dr & Grand Ave-Millennium Park",
    "viajes_realizados": "2436",
    "promedio_recorrido": "35.28"
  },
  {
    "ruta_viaje_ocasional": "Millennium Park-Millennium Park",
    "viajes_realizados": "2396",
    "promedio_recorrido": "55.79"
  },
  {
    "ruta_viaje_ocasional": "Streeter Dr & Grand Ave-Lake Shore Dr & Monroe St",
    "viajes_realizados": "2324",
    "promedio_recorrido": "34.24"
  },
  {
    "ruta_viaje_ocasional": "Millennium Park-Streeter Dr & Grand Ave",
    "viajes_realizados": "2254",
    "promedio_recorrido": "45.74"
  },
  {
    "ruta_viaje_ocasional": "Montrose Harbor-Montrose Harbor",
    "viajes_realizados": "2142",
    "promedio_recorrido": "63.97"
  }
]

* Top 10 rutas realizadas por Miembros
[
  {
    "ruta_viaje_miembro": "Canal St & Adams St-Michigan Ave & Washington St",
    "viajes_realizados": "3004",
    "promedio_recorrido": "9.01"
  },
  {
    "ruta_viaje_miembro": "Columbus Dr & Randolph St-Clinton St & Washington Blvd",
    "viajes_realizados": "2336",
    "promedio_recorrido": "9.89"
  },
  {
    "ruta_viaje_miembro": "Michigan Ave & Washington St-Clinton St & Washington Blvd",
    "viajes_realizados": "2336",
    "promedio_recorrido": "8.03"
  },
  {
    "ruta_viaje_miembro": "Michigan Ave & Washington St-Canal St & Adams St",
    "viajes_realizados": "2168",
    "promedio_recorrido": "9.50"
  },
  {
    "ruta_viaje_miembro": "Canal St & Madison St-Michigan Ave & Washington St",
    "viajes_realizados": "2039",
    "promedio_recorrido": "7.67"
  },
  {
    "ruta_viaje_miembro": "Clinton St & Washington Blvd-Michigan Ave & Washington St",
    "viajes_realizados": "1957",
    "promedio_recorrido": "7.82"
  },
  {
    "ruta_viaje_miembro": "Columbus Dr & Randolph St-State St & Randolph St",
    "viajes_realizados": "1907",
    "promedio_recorrido": "3.48"
  },
  {
    "ruta_viaje_miembro": "Wacker Dr & Washington St-Michigan Ave & Washington St",
    "viajes_realizados": "1860",
    "promedio_recorrido": "5.92"
  },
  {
    "ruta_viaje_miembro": "Columbus Dr & Randolph St-Canal St & Adams St",
    "viajes_realizados": "1772",
    "promedio_recorrido": "11.83"
  },
  {
    "ruta_viaje_miembro": "MLK Jr Dr & 29th St-State St & 33rd St",
    "viajes_realizados": "1679",
    "promedio_recorrido": "7.39"
  }
]
*/