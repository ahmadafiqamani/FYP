from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    role = models.CharField(
        max_length=10,
        choices=[("admin", "Admin"), ("basic", "Basic")],
        default="basic",
    )
    
    def is_admin(self):
        return self.role == 'admin'

    def is_basic(self):
        return self.role == 'basic'
