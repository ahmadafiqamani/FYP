from django.urls import path
from . import views

app_name = 'sensor_monitor'

urlpatterns = [
    path('sensor_monitor/', views.sensor_data, name='sensor_data'),
]
