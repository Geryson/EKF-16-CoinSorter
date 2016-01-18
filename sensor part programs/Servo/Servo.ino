//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port

#include <Servo.h>
Servo myServo;
 
void setup() { 
   myServo.attach(9);
}
void loop() {
  myServo.write(2);
  delay(5000);
  myServo.write(28);
  delay(5000);
  myServo.write(54);
  delay(5000);
  myServo.write(82);
  delay(5000);
  myServo.write(110);
  delay(5000);
  myServo.write(138);
  delay(5000);
}   
