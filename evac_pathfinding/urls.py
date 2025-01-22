from django.urls import path
from . import views

app_name = 'evac_pathfinding'

urlpatterns = [
    path('path/', views.evacuation_path, name='evacuation_path'),
]
