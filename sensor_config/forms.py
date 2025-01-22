from django import forms
from .models import SensorThreshold

class SensorThresholdForm(forms.ModelForm):
    class Meta:
        model = SensorThreshold
        fields = ['flame_threshold', 'smokeB_threshold', 'smokeC_threshold', 'temperature_threshold', 'humidity_threshold', 'distance_threshold', 'reedswitch_threshold', 'motion_threshold']
        widgets = {
            'flame_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'smokeB_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'smokeC_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'temperature_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'humidity_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'distance_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'reedswitch_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
            'motion_threshold': forms.NumberInput(attrs={'class': 'form-control'}),
        }
