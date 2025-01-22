from django.db import models

class BlockedPath(models.Model):
    start = models.CharField(max_length=1)  #start node
    end = models.CharField(max_length=1)    #end node
    timestamp = models.DateTimeField(auto_now_add=True)
