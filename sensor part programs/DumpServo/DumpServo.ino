//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port
//MÉG NINCS KÉSZ!
#include <Servo.h>
Servo myServo;
 
void setup() { 
   
   
 
}
void loop() {
  //órajárással megegyező irányba és vissza
  myServo.attach(9);
  myServo.writeMicroseconds(1490);
  delay(3000);
  myServo.writeMicroseconds(1520);
  delay(2996);
  myServo.detach();
  delay(2000);

  //órajárással ellentétes irányba és vissza
  myServo.attach(9);
  myServo.writeMicroseconds(1520);
  delay(3000);
  myServo.writeMicroseconds(1490);
  delay(2880);
  myServo.detach();
  delay(2000);
  
}   
