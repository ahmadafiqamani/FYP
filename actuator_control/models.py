from django.db import models

class ActuatorState(models.Model):
    node = models.CharField(max_length=10, unique=True)  # Node identifier, e.g., F, G
    red_led = models.BooleanField(default=False)
    green_led = models.BooleanField(default=False)
    buzzer = models.BooleanField(default=False)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Node {self.node}: Red LED - {self.red_led}, Green LED - {self.green_led}, Buzzer - {self.buzzer}"
