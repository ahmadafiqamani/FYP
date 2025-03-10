# Generated by Django 5.1.4 on 2025-01-06 06:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SensorThreshold',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('flame_threshold', models.IntegerField(default=0)),
                ('smokeB_threshold', models.IntegerField(default=0)),
                ('smokeC_threshold', models.IntegerField(default=0)),
                ('temperature_threshold', models.FloatField(default=40.0)),
                ('humidity_threshold', models.FloatField(default=50.0)),
                ('distance_threshold', models.IntegerField(default=5)),
                ('reedswitch_threshold', models.IntegerField(default=1)),
                ('motion_threshold', models.IntegerField(default=0)),
            ],
        ),
    ]
