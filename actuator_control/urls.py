from django.urls import path
from . import views

urlpatterns = [
    path("state/<str:node>/", views.get_actuator_state, name="get_actuator_state"),
    path("update/<str:node>/", views.update_actuator_state, name="update_actuator_state"),
    path("control_panel/", views.control_panel, name="control_panel"),
]
