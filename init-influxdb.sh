#!/bin/bash
# Starte den InfluxDB-Dienst im Hintergrund
influxd &

# Warte, bis InfluxDB erreichbar ist
until curl -s http://localhost:8086/ping; do
    echo "Warte auf InfluxDB..."
    sleep 1
done

# Erstelle mehrere Datenbanken
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE DCPData"

# Halte den InfluxDB-Dienst am Laufen
wait