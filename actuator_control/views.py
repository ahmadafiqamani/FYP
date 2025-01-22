from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from .models import ActuatorState
from sensor_monitor.models import SensorReading
from django.views.decorators.csrf import csrf_exempt
from django.utils.timezone import now, timedelta

def control_panel(request):
    return render(request, "actuator_control/control_panel.html")

#fetch current actuator state
def get_actuator_state(request, node):
    try:
        state = ActuatorState.objects.get(node=node)
        return JsonResponse({
            "node": state.node,
            "red_led": state.red_led,
            "green_led": state.green_led,
            "buzzer": state.buzzer,
        })
    except ActuatorState.DoesNotExist:
        return JsonResponse({"error": "Node not found"}, status=404)

#update actuator state (manual override)
@csrf_exempt
def update_actuator_state(request, node):
    if request.method == "POST":
        try:
            state = ActuatorState.objects.get(node=node)
            state.red_led = request.POST.get("red_led") == "true"
            state.green_led = request.POST.get("green_led") == "true"
            state.buzzer = request.POST.get("buzzer") == "true"
            state.save()
            return JsonResponse({"message": "Actuator state updated successfully"})
        except ActuatorState.DoesNotExist:
            return JsonResponse({"error": "Node not found"}, status=404)
    return JsonResponse({"error": "Invalid request method"}, status=400)

def update_actuators_from_sensors():
    nodes = {"F": ["flame", "smokeB"], "G": ["motion", "smokeC"]}
    thresholds = {"flame": 50, "smokeB": 200, "smokeC": 200, "motion": 1}

    for node, sensors in nodes.items():
        recent_readings = SensorReading.objects.filter(
            timestamp__gte=now() - timedelta(minutes=10)
        )
        danger = any(
            recent_readings.aggregate(models.Avg(sensor))[f"{sensor}__avg"] > thresholds[sensor]
            for sensor in sensors
        )
        state, _ = ActuatorState.objects.get_or_create(node=node)
        state.red_led = danger
        state.green_led = not danger
        state.buzzer = danger
        state.save()

from .gpio_controller import turn_on_led, turn_off_led, activate_buzzer, deactivate_buzzer

def control_actuators(request):
    flame_detected = True
    smoke_detected = False

    #LED control
    if flame_detected or smoke_detected:
        turn_on_led(RED_LED_PIN)
        turn_off_led(GREEN_LED_PIN)
        activate_buzzer()
    else:
        turn_off_led(RED_LED_PIN)
        turn_on_led(GREEN_LED_PIN)
        deactivate_buzzer()

    return HttpResponse("Actuators have been updated.")
