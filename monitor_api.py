import yaml
import requests
import time
from datetime import datetime

with open("endpoints.yaml", "r") as archivo:
    config = yaml.safe_load(archivo)

print(f"=== MONITOREO DE SERVICIOS ({datetime.now().strftime('%Y-%m-%d %H:%M:%S')}) ===\n")

for servicio in config["servicios"]:
    nombre = servicio["nombre"]
    url = servicio["url"]
    inicio = time.time()
    
    try:
        respuesta = requests.get(url, timeout=5)
        latencia = round((time.time() - inicio) * 1000, 2)
        
        if respuesta.status_code == 200:
            print(f"[OK] {nombre} -> Código: {respuesta.status_code} | Latencia: {latencia} ms")
        else:
            print(f"[ALERTA] {nombre} -> Código: {respuesta.status_code} | Latencia: {latencia} ms")
            
    except requests.exceptions.RequestException as error:
        print(f"[CRÍTICO] {nombre} -> Error de conexión: {error}")
