//pins for the ultrasonic sensor
const int trigPinRear = 2;
const int echoPinRear = 3;
const int trigPinFront = 4;
const int echoPinFront = 5;

//variables for maesuring the distance
long durationRear;
int distanceRear;
//speed of sound = 0.034 cm/us
//distance = duration * 0.034 / 2 
long durationFront;
int distanceFront;

//pins for the buzzer
const int buzzerRear = 6;
const int buzzerFront = 7;

void setup(){
  pinMode(trigPinRear, OUTPUT);
  pinMode(echoPinRear, INPUT);
  pinMode(trigPinFront, OUTPUT);
  pinMode(echoPinFront, INPUT);
  pinMode(buzzerRear, OUTPUT);
  pinMode(buzzerFront, OUTPUT);
  Serial.begin(9600);
}

void loop(){
  measureRearDist();
  delay(200);
  measureFrontDist();
  Serial.println("REAR");
  Serial.println(distanceRear);
  Serial.println("FRONT");
  Serial.println(distanceFront);
  alarmRear();
  alarmFront();
}

void measureRearDist (){
  digitalWrite(trigPinRear, LOW);
  digitalWrite(trigPinRear, HIGH);
  digitalWrite(trigPinRear, LOW);
  durationRear = pulseIn(echoPinRear, HIGH);
  distanceRear = durationRear * 0.034 / 2 / 2;
}

void measureFrontDist (){
  digitalWrite(trigPinFront, LOW);
  digitalWrite(trigPinFront, HIGH);
  digitalWrite(trigPinFront, LOW);
  durationFront = pulseIn(echoPinFront, HIGH);
  distanceFront = durationFront * 0.034 / 2 / 2;
}

void alarmRear() {
  if (distanceRear >= 9){
    noTone(buzzerRear);
  }
  else if (distanceRear >= 6 && distanceRear < 9){
    tone(buzzerRear, 261);
    delay(150);
    noTone(buzzerRear);
  }
  else if (distanceRear >= 3 && distanceRear < 6){
    tone(buzzerRear, 330);
    delay(100);
    noTone(buzzerRear);
  }
  else if (distanceRear > 0 && distanceRear < 3){
    tone(buzzerRear, 440);
    delay(50);
    noTone(buzzerRear);
  }
  else if (distanceRear == 0){
    tone(buzzerRear, 440);
  }
}

void alarmFront() {
  if (distanceFront >= 9){
    noTone(buzzerFront);
  }
  else if (distanceFront >= 6 && distanceFront < 9){
    tone(buzzerFront, 261);
    delay(150);
    noTone(buzzerFront);
  }
  else if (distanceFront >= 3 && distanceFront < 6){
    tone(buzzerFront, 330);
    delay(100);
    noTone(buzzerFront);
  }
  else if (distanceFront > 0 && distanceFront < 3){
    tone(buzzerFront, 440);
    delay(50);
    noTone(buzzerFront);
  }
  else if (distanceFront == 0){
    tone(buzzerFront, 440);
  }
}
