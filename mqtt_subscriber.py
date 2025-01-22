import paho.mqtt.client as mqtt
import json
import mysql.connector

#mqtt creds
broker = "10.42.0.1"
port = 1883
username = "amani_mosquitto"
password = "password"

#db creds
db_host = "localhost"
db_user = "amani"
db_password = "password"
db_name = "FYP"

def connect_db():
    try:
        connection = mysql.connector.connect(
            host=db_host,
            user=db_user,
            password=db_password,
            database=db_name
        )
        return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def on_message(client, userdata, msg):
    try:
        print(f"Message received on topic: {msg.topic}")

        payload = json.loads(msg.payload.decode())
        
        flame = payload.get("flame", 0)
        smokeB = payload.get("smokeB", 0)
        smokeC = payload.get("smokeC", 0)
        temperature = payload.get("temperature", 0)
        humidity = payload.get("humidity", 0)
        distance = payload.get("distance", 0)
        reedswitch = payload.get("reedswitch", 0)
        motion = payload.get("motion", 0)
        
        print(f"flame: {flame}, smokeB: {smokeB}, smokeC: {smokeC}, temperature: {temperature}, humidity: {humidity}, distance: {distance}, reedswitch: {reedswitch}, motion: {motion}")

        connection = connect_db()
        if connection:
            cursor = connection.cursor()

            #insert into table
            cursor.execute("""
                INSERT INTO sensor_monitor_sensorreading (flame, smokeB, smokeC, temperature, humidity, distance, reedswitch, motion)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """, (flame, smokeB, smokeC, temperature, humidity, distance, reedswitch, motion))

            connection.commit()

            cursor.close()
            connection.close()
            print(f"Reading {payload} inserted into database.")

    except Exception as e:
        print(f"Error processing message: {e}")

#mqtt client setup
client = mqtt.Client()
client.username_pw_set(username, password)
client.on_message = on_message

client.connect(broker, port)
client.subscribe("esp8266/sensors")

client.loop_forever()
