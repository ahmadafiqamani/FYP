from django.db import models

class TestScenario(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class TestResult(models.Model):
    scenario = models.ForeignKey(TestScenario, on_delete=models.CASCADE)
    response_time_ms = models.FloatField()
    sensor_accuracy = models.FloatField()
    pathfinding_time_ms = models.FloatField()
    notes = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Results for {self.scenario.name} ({self.created_at})"
