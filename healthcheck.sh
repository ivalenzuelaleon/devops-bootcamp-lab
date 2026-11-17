#!/bin/bash
echo "=== REPORTE DE SALUD DEL SERVIDOR ==="
echo "Fecha: $(date)"
echo "Uptime: $(uptime -p)"
echo "--- Uso de Memoria ---"
free -h | grep Mem
echo "--- Uso de Disco ---"
df -h / | tail -n 1
