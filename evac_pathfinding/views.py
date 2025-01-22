from django.shortcuts import render
from .models import Node, Edge
from sensor_monitor.models import SensorReading
import heapq


def dijkstra(source, target, unsafe_nodes=[]):
    # Build graph representation
    graph = {node.name: {} for node in Node.objects.all()}
    for edge in Edge.objects.all():
        # Adjust edge weights for unsafe nodes
        weight = edge.weight + (100 if edge.source.name in unsafe_nodes or edge.destination.name in unsafe_nodes else 0)
        graph[edge.source.name][edge.destination.name] = weight

    # Initialize data structures for Dijkstra's algorithm
    priority_queue = [(0, source)]
    distances = {node: float('inf') for node in graph}
    distances[source] = 0
    previous = {node: None for node in graph}

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)

        # Skip processing if we encounter a suboptimal path
        if current_distance > distances[current_node]:
            continue

        # Update neighbors
        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                previous[neighbor] = current_node
                heapq.heappush(priority_queue, (distance, neighbor))

    # Reconstruct the path from source to target
    path = []
    while target:
        path.insert(0, target)
        target = previous[target]

    return path, distances


def evacuation_path(request):
    source = request.GET.get("source", "B")  # Default starting point
    target = request.GET.get("target", "F")  # Default destination

    # Retrieve the latest sensor readings (last 10 entries)
    sensor_readings = SensorReading.objects.order_by('-timestamp')[:10]

    # Calculate averages for relevant sensor readings
    avg_flame = (
        sum([r.flame for r in sensor_readings if r.flame is not None]) / len(sensor_readings)
        if sensor_readings else 0
    )
    avg_smoke = (
        sum([r.smokeB for r in sensor_readings if r.smokeB is not None]) / len(sensor_readings)
        if sensor_readings else 0
    )

    # Identify unsafe nodes based on thresholds
    unsafe_nodes = []
    if avg_flame > 0:  # Example threshold for flame
        unsafe_nodes.append("D")  # Node with flame sensor
    if avg_smoke > 0:  # Example threshold for smoke
        unsafe_nodes.append("C")  # Node with smoke sensor

    # Calculate evacuation path using Dijkstra's algorithm
    path, distances = dijkstra(source, target, unsafe_nodes)

    # Context for rendering the template
    context = {
        'path': path,
        'distance': distances[path[-1]] if path else "No route available",
        'unsafe_nodes': unsafe_nodes,
        'source': source,
        'target': target,
    }

    return render(request, 'evac_pathfinding/path.html', context)
