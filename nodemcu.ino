#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <dht11.h>
dht11 DHT;

//network credentials
const char* ssid = "YOUR WIFI SSID";
const char* password = "YOUR WIFI PASSWORD";

//mqtt server credentials
const char* mqttServer = "ADDRESS OF MQTT SERVER";
const int mqttPort = 1883;
const char* mqttUser = "YOUR MQTT USERNAME";
const char* mqttPassword = "YOUR MQTT PASSWORD";
const char* mqttTopic = "YOUR MQTT TOPIC";

WiFiClient espClient;
PubSubClient client(espClient);

//define pin connections
int A_flame = D0;
int B_smoke = D1;
int C_smoke = D2;
int D_dht11 = D3;
int E_proximityTrig = D5;
int E_proximityEcho = D6;
int F_reedSwitch = D4;
int G_pir = D7;

//read proximity sensor distance
int readProximitySensor(int trigPin, int echoPin) {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  int duration = pulseIn(echoPin, HIGH);
  int distance = duration * 0.034 / 2; // cm
  return distance;
}

void setup() {
  Serial.begin(115200);

  //connect network
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected");

  client.setServer(mqttServer, mqttPort);

  //connect mqtt broker
  while (!client.connected()) {
    Serial.print("Connecting to MQTT...");
    if (client.connect("ESP8266Client1", mqttUser, mqttPassword)) {
      Serial.println("connected");
    } else {
      Serial.print("failed with state ");
      Serial.println(client.state());
      delay(2000);
    }
  }

  pinMode(A_flame, INPUT);
  pinMode(B_smoke, INPUT);
  pinMode(C_smoke, INPUT);
  int chk = DHT.read(D_dht11);
  pinMode(E_proximityTrig, OUTPUT);
  pinMode(E_proximityEcho, INPUT);
  pinMode(F_reedSwitch, INPUT);
  pinMode(G_pir, INPUT);
}

void loop() {
  client.loop();
  
  int flameReading = digitalRead(A_flame);
  int smokeBReading = digitalRead(B_smoke);
  int smokeCReading = digitalRead(C_smoke);
  float temperature = DHT.temperature;
  float humidity = DHT.humidity;
  int proximityDistance = readProximitySensor(E_proximityTrig, E_proximityEcho);
  int reedSwitchState = digitalRead(F_reedSwitch);
  int pirReading = digitalRead(G_pir);

  //payload mesage
  String payload = "{";
  payload += "\"flame\":" + String(flameReading) + ",";
  payload += "\"smokeB\":" + String(smokeBReading) + ",";
  payload += "\"smokeC\":" + String(smokeCReading) + ",";
  payload += "\"temperature\":" + String(temperature) + ",";
  payload += "\"humidity\":" + String(humidity) + ",";
  payload += "\"distance\":" + String(proximityDistance) + ",";
  payload += "\"reedswitch\":" + String(reedSwitchState) + ",";
  payload += "\"motion\":" + String(pirReading);
  payload += "}";

  // Send payload
  client.publish(mqttTopic, payload.c_str());
  Serial.println("Published: " + payload);

  delay(2000); //2s delay
}
