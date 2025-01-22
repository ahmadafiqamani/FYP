from django.shortcuts import render
from django.db import connection
from django.db.models import Avg
from sensor_monitor.models import SensorReading
from sensor_config.models import SensorThreshold

def sensor_data(request):

    readings = SensorReading.objects.all().order_by('-timestamp')[:100]

    return render(request, "sensor_data.html", {"readings": readings})

def monitor_sensors(request):
    # Get the latest sensor thresholds
    thresholds = SensorThreshold.objects.first()
    
    # Fetch the last 10 readings for each sensor
    recent_readings = SensorReading.objects.order_by('-timestamp')[:10]

    averages = recent_readings.aggregate(
        flame_avg=Avg('flame'),
        smokeB_avg=Avg('smokeB'),
        smokeC_avg=Avg('smokeC'),
        temperature_avg=Avg('temperature'),
        humidity_avg=Avg('humidity'),
        distance_avg=Avg('distance'),
        reedswitch_avg=Avg('reedswitch'),
        motion_avg=Avg('motion'),
    )
    
    alerts = []
    if averages['flame_avg'] and averages['flame_avg'] > thresholds.flame_threshold:
        alerts.append("Flame average exceeds threshold!")
    if averages['smokeB_avg'] and averages['smokeB_avg'] > thresholds.smokeB_threshold:
        alerts.append("Smoke B average exceeds threshold!")
    if averages['smokeC_avg'] and averages['smokeC_avg'] > thresholds.smokeC_threshold:
        alerts.append("Smoke C average exceeds threshold!")
    if averages['temperature_avg'] and averages['temperature_avg'] > thresholds.temperature_threshold:
        alerts.append("Temperature average exceeds threshold!")
    if averages['humidity_avg'] and averages['humidity_avg'] > thresholds.humidity_threshold:
        alerts.append("Humidity average exceeds threshold!")
    if averages['distance_avg'] and averages['distance_avg'] < thresholds.distance_threshold:  # Assuming lower is dangerous
        alerts.append("Distance average below threshold!")
    if averages['reedswitch_avg'] and averages['reedswitch_avg'] > thresholds.reedswitch_threshold:
        alerts.append("Reedswitch average exceeds threshold!")
    if averages['motion_avg'] and averages['motion_avg'] > thresholds.motion_threshold:
        alerts.append("Motion average exceeds threshold!")

    readings = SensorReading.objects.order_by('-timestamp')[:100]
    return render(request, 'sensor_monitor/sensor_data.html', {
        'readings': readings,
        'alerts': alerts,
    })
    