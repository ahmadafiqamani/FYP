from django.shortcuts import render
from evac_pathfinding.models import Node, Edge
from sensor_monitor.models import SensorReading
import heapq
import time

def dijkstra(source, target, unsafe_nodes=[]):
    graph = {node.name: {} for node in Node.objects.all()}
    for edge in Edge.objects.all():
        weight = edge.weight
        if edge.source.name in unsafe_nodes or edge.destination.name in unsafe_nodes:
            weight += 100
        graph[edge.source.name][edge.destination.name] = weight

    #djikstra
    priority_queue = [(0, source)]
    distances = {node: float('inf') for node in graph}
    distances[source] = 0
    previous = {node: None for node in graph}

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)
        if current_distance > distances[current_node]:
            continue
        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                previous[neighbor] = current_node
                heapq.heappush(priority_queue, (distance, neighbor))

    #update path
    path = []
    while target:
        path.insert(0, target)
        target = previous[target]

    return path, distances

def system_testing(request):
    nodes = Node.objects.all()
    edges = Edge.objects.all()

    #fetch sensor readings
    sensor_readings = SensorReading.objects.order_by('-timestamp')[:1].first()
    if not sensor_readings:
        return render(request, 'system_testing/test.html', {
            'error': 'No sensor data available.',
        })

    #thresholds
    unsafe_nodes = []
    if sensor_readings.flame > 50:
        unsafe_nodes.append("A")
    if sensor_readings.smokeB > 30:
        unsafe_nodes.append("B")
    if sensor_readings.smokeC > 30:
        unsafe_nodes.append("C")
    if sensor_readings.temperature > 40:
        unsafe_nodes.append("D")

    valid_sources = ["A", "B", "C", "D", "E"]
    valid_targets = ["F", "G"]

    #source and target from user input
    source = request.GET.get("source", "A")
    target = request.GET.get("target", "G")

    #user input validation
    if source not in valid_sources or target not in valid_targets:
        return render(request, 'system_testing/test.html', {
            'error': 'Invalid source or target. Source must be one of A, B, C, D, E, and target must be F or G.',
            'nodes': nodes,
            'edges': edges,
        })

    #pathfinding time
    start_time = time.time()
    path, distances = dijkstra(source, target, unsafe_nodes)
    end_time = time.time()
    response_time = (end_time - start_time) * 1000  #convert ms

    context = {
        'nodes': nodes,
        'edges': edges,
        'sensor_readings': sensor_readings,
        'unsafe_nodes': unsafe_nodes,
        'path': path,
        'distance': distances[path[-1]] if path else "N/A",
        'response_time': response_time,
        'valid_sources': valid_sources,
        'valid_targets': valid_targets,
    }
    return render(request, 'system_testing/test.html', context)
