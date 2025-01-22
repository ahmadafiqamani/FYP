from django.urls import path
from . import views

urlpatterns = [
    path('system_testing/', views.system_testing, name='test'),
]
