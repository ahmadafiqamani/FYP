import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

#node G
RED_LED_PIN = 12
GREEN_LED_PIN = 16
#node F
RED_LED_PIN = 11
GREEN_LED_PIN = 17
BUZZER_PIN = 26

GPIO.setup(RED_LED_PIN, GPIO.OUT)
GPIO.setup(GREEN_LED_PIN, GPIO.OUT)
GPIO.setup(BUZZER_PIN, GPIO.OUT)

def turn_on_led(pin):
    GPIO.output(pin, GPIO.HIGH)

def turn_off_led(pin):
    GPIO.output(pin, GPIO.LOW)

def activate_buzzer():
    GPIO.output(BUZZER_PIN, GPIO.HIGH)

def deactivate_buzzer():
    GPIO.output(BUZZER_PIN, GPIO.LOW)

def cleanup_gpio():
    GPIO.cleanup()
