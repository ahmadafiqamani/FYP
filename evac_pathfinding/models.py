from django.db import models

class Node(models.Model):
    name = models.CharField(max_length=10, unique=True)

    def __str__(self):
        return self.name

class Edge(models.Model):
    source = models.ForeignKey(Node, related_name='edges_out', on_delete=models.CASCADE)
    destination = models.ForeignKey(Node, related_name='edges_in', on_delete=models.CASCADE)
    weight = models.FloatField()

    def __str__(self):
        return f"{self.source} -> {self.destination} ({self.weight})"

