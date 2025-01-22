from django.shortcuts import render, redirect
from .models import SensorThreshold
from .forms import SensorThresholdForm

def update_thresholds(request):
    #fetch current thresholds
    sensor_threshold = SensorThreshold.objects.first()

    if request.method == 'POST':
        form = SensorThresholdForm(request.POST, instance=sensor_threshold)
        if form.is_valid():
            form.save()
            return redirect('sensor_config:update_thresholds')
    else:
        form = SensorThresholdForm(instance=sensor_threshold)

    return render(request, 'sensor_config/update_thresholds.html', {'form': form})
