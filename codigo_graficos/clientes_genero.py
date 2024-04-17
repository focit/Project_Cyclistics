import matplotlib.pyplot as plt

# Datos en formato JSON
data = [
    {"gender": "Femenino", "viajes_customer": 103695, "viajes_subscriber": 599795},
    {"gender": "Masculino", "viajes_customer": 164712, "viajes_subscriber": 1847245}
]

# Extraer los datos
genders = [entry["gender"] for entry in data]
viajes_customer = [int(entry["viajes_customer"]) for entry in data]
viajes_subscriber = [int(entry["viajes_subscriber"]) for entry in data]

# Gráfico de pastel para Customer
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.pie(viajes_customer, labels=genders, autopct='%1.1f%%', startangle=90)
plt.title('Customer vs. Subscriber: Porcentaje del género de los usuarios Customer en 2019')

# Gráfico de pastel para Subscriber
plt.subplot(1, 2, 2)
plt.pie(viajes_subscriber, labels=genders, autopct='%1.1f%%', startangle=90)
plt.title('Customer vs. Subscriber: Porcentaje del género de los usuarios Subscriber en 2019')

# Mostrar los gráficos
plt.tight_layout()
plt.show()