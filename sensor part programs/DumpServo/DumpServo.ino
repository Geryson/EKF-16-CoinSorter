//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port

#include <Servo.h>
Servo myServo;
 
void setup() { 
   myServo.attach(9);
}
void loop() {
  myServo.writeMicroseconds(1300);
  delay(500);
  myServo.writeMicroseconds(1700);
  delay(522);
  myServo.writeMicroseconds(1515);
  delay(500);
}   
