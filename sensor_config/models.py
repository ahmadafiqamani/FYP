from django.db import models

class SensorThreshold(models.Model):
    flame_threshold = models.IntegerField(default=0)
    smokeB_threshold = models.IntegerField(default=0)
    smokeC_threshold = models.IntegerField(default=0)
    temperature_threshold = models.FloatField(default=40.0)
    humidity_threshold = models.FloatField(default=50.0)
    distance_threshold = models.IntegerField(default=5)
    reedswitch_threshold = models.IntegerField(default=1)  #0=closed
    motion_threshold = models.IntegerField(default=0)  #0=no motion

    def __str__(self):
        return "Sensor Threshold Configuration"
