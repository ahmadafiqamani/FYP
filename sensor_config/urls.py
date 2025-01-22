from django.urls import path
from . import views

app_name = 'sensor_config'

urlpatterns = [
    path('update/', views.update_thresholds, name='update_thresholds'),
]
