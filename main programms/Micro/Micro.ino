//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port
//MÉG NINCS KÉSZ!
#include <Servo.h>
Servo myServo;

bool van_erme = false;
void setup() {
    Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


}


  int motor_standard = 9; //(PWM)
  int motor_continous = 10; //(PWM)
   

void loop() { 
 int solar = analogRead(A0);
  Serial.println(solar);
  coinsput(solar); //a coinsput fgv meghívja standard_motor fgvt, ami pedig meghívja a right_motor vagy left_motor fgv-t

  //a delay-ekkel vigyázni kell vagy pedig többszálat kell használni


}

void standard_motor (int szog, int erme_neve)
{
  myServo.attach(motor_standard);
   myServo.write(szog);
   if ( erme_neve == 5 || erme_neve == 10 || erme_neve == 20) {left_motor();} 
   else {right_motor();}
  delay(2000);
  //majd álljon vissza 0 fokra
  myServo.write(180);
  delay(2000);
}

void right_motor() {
  //órajárással megegyező irányba és vissza
  myServo.attach(motor_continous);
  myServo.writeMicroseconds(1490);
  delay(3000);
  myServo.writeMicroseconds(1520);
  delay(2996);
  myServo.detach();
  delay(2000);
}

void left_motor() {
  myServo.attach(motor_continous);
  myServo.writeMicroseconds(1520);
  delay(3000);
  myServo.writeMicroseconds(1490);
  delay(2880);
  myServo.detach();
  delay(2000);
}

bool coinsput(int solar)
{
  van_erme = true;
  bool r = false;
  if (van_erme) {
    r = true;
  }
  while (van_erme) {
    //erme vizsgálat hogy milyen érme van

    //cimek:0-5-ig 5-200-ig növekvősorrendbe
    //6 -> össz érme

   int erme_neve = 0; //ide a megvizsgált érme neve kell (5-200)

    if ( solar < 20 ) {
      erme_neve = 200;
    }
    else {
      if ( solar < 30 ) {
        erme_neve = 100;
      }
      else {
        if ( solar < 40 ) {
          erme_neve = 50;
        }
        else {
          if ( solar < 60 ) {
            erme_neve = 20;
          }
          else {
            if ( solar < 80 ) {
              erme_neve = 10;
            }
            else {
              if ( solar < 100 ) {
                erme_neve = 5;
              }
            }
          }
        }
      }
    }

    int standard_szog[3] = {45, 90, 135} ;

    if (erme_neve == 5 || erme_neve == 50) { standard_motor(standard_szog[0], erme_neve); }
    else {if (erme_neve == 10 || erme_neve == 100) { standard_motor(standard_szog[1], erme_neve); } 
    else {if (erme_neve == 20 || erme_neve == 200) { standard_motor(standard_szog[2], erme_neve); }}}
    
    //a standard fgv ben állítjuk be a contionous motort

    
    Serial.println(erme_neve);


  
  van_erme = false;
    delay(500);
  }

  return r;
}
