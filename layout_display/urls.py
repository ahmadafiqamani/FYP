from django.urls import path
from . import views

app_name = 'layout_display'

urlpatterns = [
    path('layout/', views.layout_display, name='layout_display'),
]
