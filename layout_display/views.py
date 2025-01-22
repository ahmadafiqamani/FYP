from django.shortcuts import render
from .models import BlockedPath
import json

def layout_display(request):
    # Graph Layout Data
    layout = {
        'A': {'B': 8, 'E': 12, 'F': 12},
        'B': {'A': 8, 'E': 10, 'F': 13},
        'C': {'E': 15, 'F': 9},
        'D': {'E': 13, 'F': 11},
        'E': {'A': 12, 'B': 10, 'C': 15, 'D': 13, 'F': 16, 'G': 3},
        'F': {'A': 12, 'B': 13, 'C': 9, 'D': 11, 'E': 16},
        'G': {'E': 3},
    }


    # Get dynamically blocked paths
    # blocked_paths = BlockedPath.objects.values_list('start', 'end')
    blocked_paths = [
        ["A", "B"], ["C", "F"]
    ]
    """
    context = {
        'layout': LAYOUT,
        'blocked_paths': list(blocked_paths),
    }"""

    return render(request, 'layout_display/layout_display.html', {
        'layout': json.dumps(layout),
        'blocked_paths': json.dumps(blocked_paths)
    })
