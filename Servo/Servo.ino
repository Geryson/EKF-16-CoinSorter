//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port

#include <Servo.h>
Servo myServo;
 
void setup() { 
   myServo.attach(9);
   
 
}
void loop() {
  
  myServo.write(0);
  delay(2000);
  myServo.write(36);
  delay(2000);
  myServo.write(72);
  delay(2000);
  myServo.write(108);
  delay(2000);
  myServo.write(144);
  delay(2000);
  myServo.write(180);
  delay(2000);
  
}   
