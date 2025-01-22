from django.shortcuts import render
from .models import Node, Edge
from sensor_monitor.models import SensorReading
import heapq


def dijkstra(source, target, unsafe_nodes=[]):
    #graph representation
    graph = {node.name: {} for node in Node.objects.all()}
    for edge in Edge.objects.all():
        #dynamic weight updates
        weight = edge.weight + (100 if edge.source.name in unsafe_nodes or edge.destination.name in unsafe_nodes else 0)
        graph[edge.source.name][edge.destination.name] = weight

    priority_queue = [(0, source)]
    distances = {node: float('inf') for node in graph}
    distances[source] = 0
    previous = {node: None for node in graph}

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)

        if current_distance > distances[current_node]:
            continue

        #ipdate neighbors
        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                previous[neighbor] = current_node
                heapq.heappush(priority_queue, (distance, neighbor))

    #new pathways
    path = []
    while target:
        path.insert(0, target)
        target = previous[target]

    return path, distances


def evacuation_path(request):
    source = request.GET.get("source", "B")
    target = request.GET.get("target", "F")

    #fetch last 10 sensor readings
    sensor_readings = SensorReading.objects.order_by('-timestamp')[:10]

    avg_flame = (
        sum([r.flame for r in sensor_readings if r.flame is not None]) / len(sensor_readings)
        if sensor_readings else 0
    )
    avg_smoke = (
        sum([r.smokeB for r in sensor_readings if r.smokeB is not None]) / len(sensor_readings)
        if sensor_readings else 0
    )

    unsafe_nodes = []
    if avg_flame > 0:
        unsafe_nodes.append("D")
    if avg_smoke > 0:
        unsafe_nodes.append("C")

    path, distances = dijkstra(source, target, unsafe_nodes)

    context = {
        'path': path,
        'distance': distances[path[-1]] if path else "No route available",
        'unsafe_nodes': unsafe_nodes,
        'source': source,
        'target': target,
    }

    return render(request, 'evac_pathfinding/path.html', context)
