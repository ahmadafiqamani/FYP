import json
import asyncio
from channels.generic.websocket import AsyncWebsocketConsumer
from .gpio_controller import turn_on_led, turn_off_led, activate_buzzer, deactivate_buzzer
from sensor_app.models import SensorReading

class ActuatorControlConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        # Accept WebSocket connection
        self.room_group_name = "actuator_control"

        # Join the group
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name,
        )

        await self.accept()

    async def disconnect(self, close_code):
        # Leave the group on disconnect
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name,
        )

    async def receive(self, text_data):
        # Receive message from WebSocket and handle it
        data = json.loads(text_data)
        if data['action'] == 'update_actuators':
            await self.update_actuators()

    async def update_actuators(self):
        # Fetch the latest 10 sensor readings from the database
        readings = SensorReading.objects.all().order_by('-timestamp')[:10]
        
        # Calculate the averages for each sensor
        avg_flame = sum([reading.flame for reading in readings]) / len(readings)
        avg_smoke = sum([reading.smokeB + reading.smokeC for reading in readings]) / len(readings)
        avg_temperature = sum([reading.temperature for reading in readings]) / len(readings)
        
        # Determine the actuator control based on average sensor readings
        if avg_flame > 0.5 or avg_smoke > 0.5:
            # If danger (e.g., flame or smoke detected)
            turn_on_led(17)  # Red LED at node F
            turn_off_led(27) # Green LED at node F
            activate_buzzer()
        else:
            # If no danger (safe zone)
            turn_off_led(17)  # Red LED at node F
            turn_on_led(27)   # Green LED at node F
            deactivate_buzzer()

        # Send message to WebSocket to update the frontend
        await self.send(text_data=json.dumps({
            'flame': avg_flame,
            'smoke': avg_smoke,
            'temperature': avg_temperature
        }))
