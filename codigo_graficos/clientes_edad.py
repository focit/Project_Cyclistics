import matplotlib.pyplot as plt

# Datos en formato JSON
data = [
    {"edad_del_usuario": 80, "viajes_customer": 2, "viajes_subscriber": 62},
    {"edad_del_usuario": 79, "viajes_customer": 9, "viajes_subscriber": 194},
    {"edad_del_usuario": 78, "viajes_customer": 4, "viajes_subscriber": 110},
    {"edad_del_usuario": 77, "viajes_customer": 4, "viajes_subscriber": 197},
    {"edad_del_usuario": 76, "viajes_customer": 14, "viajes_subscriber": 85},
    {"edad_del_usuario": 75, "viajes_customer": 4, "viajes_subscriber": 110},
    {"edad_del_usuario": 75, "viajes_customer": 17, "viajes_subscriber": 315},
    {"edad_del_usuario": 74, "viajes_customer": 6, "viajes_subscriber": 629},
    {"edad_del_usuario": 73, "viajes_customer": 14, "viajes_subscriber": 1642},
    {"edad_del_usuario": 72, "viajes_customer": 48, "viajes_subscriber": 492},
    {"edad_del_usuario": 71, "viajes_customer": 33, "viajes_subscriber": 1861},
    {"edad_del_usuario": 70, "viajes_customer": 76, "viajes_subscriber": 1832},
    {"edad_del_usuario": 69, "viajes_customer": 98, "viajes_subscriber": 2924},
    {"edad_del_usuario": 68, "viajes_customer": 143, "viajes_subscriber": 4978},
    {"edad_del_usuario": 67, "viajes_customer": 172, "viajes_subscriber": 6234},
    {"edad_del_usuario": 66, "viajes_customer": 210, "viajes_subscriber": 5985},
    {"edad_del_usuario": 65, "viajes_customer": 212, "viajes_subscriber": 7334},
    {"edad_del_usuario": 64, "viajes_customer": 317, "viajes_subscriber": 10192},
    {"edad_del_usuario": 63, "viajes_customer": 422, "viajes_subscriber": 11739},
    {"edad_del_usuario": 62, "viajes_customer": 469, "viajes_subscriber": 11706},
    {"edad_del_usuario": 61, "viajes_customer": 587, "viajes_subscriber": 12409},
    {"edad_del_usuario": 60, "viajes_customer": 687, "viajes_subscriber": 14705},
    {"edad_del_usuario": 59, "viajes_customer": 968, "viajes_subscriber": 20579},
    {"edad_del_usuario": 58, "viajes_customer": 1064, "viajes_subscriber": 21009},
    {"edad_del_usuario": 57, "viajes_customer": 1320, "viajes_subscriber": 24664},
    {"edad_del_usuario": 56, "viajes_customer": 1291, "viajes_subscriber": 22060},
    {"edad_del_usuario": 55, "viajes_customer": 1659, "viajes_subscriber": 25059},
    {"edad_del_usuario": 54, "viajes_customer": 1417, "viajes_subscriber": 24184},
    {"edad_del_usuario": 53, "viajes_customer": 1705, "viajes_subscriber": 27379},
    {"edad_del_usuario": 52, "viajes_customer": 1693, "viajes_subscriber": 24543},
    {"edad_del_usuario": 51, "viajes_customer": 2121, "viajes_subscriber": 23799},
    {"edad_del_usuario": 50, "viajes_customer": 2068, "viajes_subscriber": 30701},
    {"edad_del_usuario": 49, "viajes_customer": 2316, "viajes_subscriber": 31381},
    {"edad_del_usuario": 48, "viajes_customer": 2300, "viajes_subscriber": 25025},
    {"edad_del_usuario": 47, "viajes_customer": 2039, "viajes_subscriber": 28978},
    {"edad_del_usuario": 46, "viajes_customer": 2286, "viajes_subscriber": 24918},
    {"edad_del_usuario": 45, "viajes_customer": 2174, "viajes_subscriber": 33462},
    {"edad_del_usuario": 44, "viajes_customer": 2743, "viajes_subscriber": 29354},
    {"edad_del_usuario": 43, "viajes_customer": 2411, "viajes_subscriber": 36154},
    {"edad_del_usuario": 42, "viajes_customer": 2845, "viajes_subscriber": 44762},
    {"edad_del_usuario": 41, "viajes_customer": 2581, "viajes_subscriber": 36372},
    {"edad_del_usuario": 40, "viajes_customer": 3239, "viajes_subscriber": 44410},
    {"edad_del_usuario": 39, "viajes_customer": 3762, "viajes_subscriber": 54894},
    {"edad_del_usuario": 38, "viajes_customer": 3931, "viajes_subscriber": 58541},
    {"edad_del_usuario": 37, "viajes_customer": 4200, "viajes_subscriber": 68820},
    {"edad_del_usuario": 36, "viajes_customer": 6385, "viajes_subscriber": 69021},
    {"edad_del_usuario": 35, "viajes_customer": 5565, "viajes_subscriber": 85172},
    {"edad_del_usuario": 34, "viajes_customer": 6287, "viajes_subscriber": 91281},
    {"edad_del_usuario": 33, "viajes_customer": 8055, "viajes_subscriber": 92034},
    {"edad_del_usuario": 32, "viajes_customer": 8883, "viajes_subscriber": 113321},
    {"edad_del_usuario": 31, "viajes_customer": 11100, "viajes_subscriber": 113931},
    {"edad_del_usuario": 30, "viajes_customer": 16058, "viajes_subscriber": 144322},
    {"edad_del_usuario": 29, "viajes_customer": 14740, "viajes_subscriber": 138624},
    {"edad_del_usuario": 28, "viajes_customer": 14561, "viajes_subscriber": 134624},
    {"edad_del_usuario": 27, "viajes_customer": 16413, "viajes_subscriber": 151563},
    {"edad_del_usuario": 26, "viajes_customer": 18194, "viajes_subscriber": 135084},
    {"edad_del_usuario": 25, "viajes_customer": 18911, "viajes_subscriber": 114835},
    {"edad_del_usuario": 24, "viajes_customer": 19306, "viajes_subscriber": 92882},
    {"edad_del_usuario": 23, "viajes_customer": 15664, "viajes_subscriber": 58356},
    {"edad_del_usuario": 22, "viajes_customer": 11262, "viajes_subscriber": 24537},
    {"edad_del_usuario": 21, "viajes_customer": 7890, "viajes_subscriber": 16536},
    {"edad_del_usuario": 20, "viajes_customer": 6774, "viajes_subscriber": 11870},
    {"edad_del_usuario": 19, "viajes_customer": 6110, "viajes_subscriber": 9124},
    {"edad_del_usuario": 18, "viajes_customer": 2492, "viajes_subscriber": 4663},
    {"edad_del_usuario": 17, "viajes_customer": 961, "viajes_subscriber": 817},
    {"edad_del_usuario": 16, "viajes_customer": 267, "viajes_subscriber": 402},
    {"edad_del_usuario": 5, "viajes_customer": 0, "viajes_subscriber": 5}
]

# Extraer los datos
edades = [entry["edad_del_usuario"] for entry in data]
viajes_customer = [entry["viajes_customer"] for entry in data]
viajes_subscriber = [entry["viajes_subscriber"] for entry in data]

# Crear los gráficos
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
plt.bar(edades, viajes_customer, color='blue')
plt.xlabel('Edad del Usuario')
plt.ylabel('Número de Viajes')
plt.title('Usuarios Customer vs. Subscriber: La edad de los usuarios Customer en 2019')

plt.subplot(1, 2, 2)
plt.bar(edades, viajes_subscriber, color='orange')
plt.xlabel('Edad del Usuario')
plt.ylabel('Número de Viajes')
plt.title('Usuarios Customer vs. Subscriber: La edad de los usuarios Subscriber en 2019')

# Mostrar los gráficos
plt.tight_layout()
plt.show()