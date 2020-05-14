#include <Servo.h>                      //include servo library
Servo myservo;                           //define servo as servo
const int waterSens = A0;            //set water sensor 1 to A0
const int waterSens2 = A1;             //set water sensor 2 to A1
int pos = 0;                                //define servo position
void setup()
{
Serial.begin(9600);
myservo.attach(9);                     //attach servo to pin 9
}
void loop()
{
int sensorValue = analogRead(waterSens);          //read the water sensor 1 value
int sensorValue2 = analogRead(waterSens2);      //read the water sensor 2 value
sensorValue = map(sensorValue, 0, 1023, 0, 180);
sensorValue2 = map(sensorValue2, 0, 1023, 0, 180);
if (sensorValue2 <= 50)
{
 if (sensorValue == 0)
 {
 pos = 0;
 myservo.write(pos);
 delay(15);
 }
 else if (sensorValue >= 50)
 {
 pos = 180;
 myservo.write(pos);
 delay(15);
 }
}
else
{
myservo.write(0);
}
Serial.println(sensorValue);
Serial.println(sensorValue2);
delay(20);
}