"""
ASGI config for FYP project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/howto/deployment/asgi/
"""

import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from actuator_control.consumers import ActuatorControlConsumer

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'FYP.settings')

application = get_asgi_application()

ASGI_APPLICATION = 'FYP.asgi.application'

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'FYP.settings')

application = ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AuthMiddlewareStack(
        URLRouter([
            # Route to Actuator Control WebSocket
            path("ws/control_actuators/", ActuatorControlConsumer.as_asgi()),
        ])
    ),
})

