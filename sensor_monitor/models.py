from django.db import models
from datetime import datetime

class SensorReading(models.Model):
    flame = models.IntegerField(null=True)
    smokeB = models.IntegerField(null=True)
    smokeC = models.IntegerField(null=True)
    temperature = models.FloatField(null=True)
    humidity = models.FloatField(null=True)
    distance = models.IntegerField(null=True)
    reedswitch = models.IntegerField(null=True)
    motion = models.IntegerField(null=True)
    timestamp = models.DateTimeField(auto_now_add=True)
