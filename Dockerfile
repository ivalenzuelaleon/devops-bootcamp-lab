# 1. Usamos una imagen base oficial y ultra ligera de Python
FROM python:3.11-slim

# 2. Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Instalamos las librerías necesarias
RUN pip install --no-cache-dir requests pyyaml

# 4. Copiamos tu script y tu archivo de configuración al contenedor
COPY endpoints.yaml .
COPY monitor_api.py .

# 5. Definimos el comando que se ejecutará al encender el contenedor
CMD ["python", "monitor_api.py"]
