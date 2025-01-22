from django.db import models

class BlockedPath(models.Model):
    start = models.CharField(max_length=1)  # Start node
    end = models.CharField(max_length=1)    # End node
    timestamp = models.DateTimeField(auto_now_add=True)
