//PIROS - 5V
//FEKETE - GND
//FEHÉR - bármelyik PWM digitális port
//MÉG NINCS KÉSZ!
#include <Servo.h>
#include <EEPROM.h>

Servo myServo;

bool van_erme = false;
int kezdetiFeszultseg;

pinMode(A0, OUTPUT);
pinMode(7, INPUT);

void setup() {
    Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  int feszultsegOsszeg = 0;
  for (int i =0; i< 10; i++) {
 feszultsegOsszeg += analogRead(A0);
 int kezdetiFeszultseg = feszultsegOsszeg / 10;
}
 



for (int i=0; i <10; i++) {
    coinsclear(i);
  }
}

int ermekertekkel[7];

  int motor_standard = 9; //(PWM)
  int motor_continous = 10; //(PWM)
  int standard_szog[6] = {2,28,54,82,110,138} ;
   

void loop() { 
  int solar_sum = 0;
for (int i =0; i< 10; i++) {
 solar_sum += analogRead(A0);
}
 int solar = solar_sum / 10;
  Serial.println(solar);
  coinsput(solar); //a coinsput fgv meghívja standard_motor fgvt, ami pedig meghívja a right_motor vagy left_motor fgv-t

  //a delay-ekkel vigyázni kell vagy pedig többszálat kell használni

}

void folosleg ()
{
  myServo.attach(motor_standard);
  myServo.write(170);
   {continous_motor();} 
}

void standard_motor (int szog)
{
  myServo.attach(motor_standard);
   myServo.write(szog);
   {continous_motor();} 

}

void continous_motor() {
  //órajárással megegyező irányba és vissza
  
  myServo.attach(motor_continous);
 
  myServo.writeMicroseconds(1300);
  delay(300);
  myServo.detach();
  
  while(digitalRead(7)==1){
    myservo.attach(9);
    myservo.writeMicroseconds(1545);
    delay(50);
    myservo.detach();
  }
}

bool coinsput(int solar)
{
  if(solar != kezdetiFeszultseg){
    van_erme = true;
  }
  
  if (van_erme) {
    
  
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
    bool folosleg_bool = false;
    
    if (erme_neve == 5 && ermekertekkel[0] < 10) { standard_motor(standard_szog[0]); }
    else {if (erme_neve == 10 && ermekertekkel[1] < 10) { standard_motor(standard_szog[1]); } 
    else {if (erme_neve == 20 && ermekertekkel[2] < 10) { standard_motor(standard_szog[2]); } 
    else {if (erme_neve == 50 && ermekertekkel[3] < 10) { standard_motor(standard_szog[3]); } 
    else {if (erme_neve == 200 && ermekertekkel[4] < 10) { standard_motor(standard_szog[4]); } 
    else {if (erme_neve == 100 && ermekertekkel[5] < 10) { standard_motor(standard_szog[5]); }
    else {folosleg (); folosleg_bool = false;}}}}}}

    if (! folosleg_bool) { coinsadd(erme_neve); }
    
    //a standard fgv ben állítjuk be a contionous motort

    
    Serial.println(erme_neve);


  
  van_erme = false;
  }
}

void sumcoins()
{
  int sum = 0;

  ermekertekkel[0] = EEPROM.read(0) * 5;
  ermekertekkel[1] = EEPROM.read(1) * 10;
  ermekertekkel[2] = EEPROM.read(2) * 20;
  ermekertekkel[3] = EEPROM.read(3) * 50;
  ermekertekkel[4] = EEPROM.read(4) * 100;
  ermekertekkel[5] = EEPROM.read(5) * 200;

  for (int i = 0; i < 6; i++)
  {
    sum += ermekertekkel[i];

  

  }
  ermekertekkel[6] = sum;
  
}


void coinsadd(int erme_neve)
{
  switch (erme_neve) {

    case 5: coinsmodify(0, EEPROM.read(0) + 1);
      coinsmodify(6, EEPROM.read(6) + 5);
      break;

    case 10: coinsmodify(1, EEPROM.read(1) + 1);
      coinsmodify(6, EEPROM.read(6) + 10);
      break;

    case 20: coinsmodify(2, EEPROM.read(2) + 1);
      coinsmodify(6, EEPROM.read(6) + 20);
      break;

    case 50: coinsmodify(3, EEPROM.read(3) + 1);
      coinsmodify(6, EEPROM.read(6) + 50);
      break;

    case 100: coinsmodify(4, EEPROM.read(4) + 1);
      coinsmodify(6, EEPROM.read(6) + 100);
      break;

    case 200: coinsmodify(5, EEPROM.read(5) + 1);
      coinsmodify(6, EEPROM.read(6) + 200);
      break;
  }
}

bool coinsmodify(byte id, byte value) {
  Serial.print(id); Serial.print("_"); Serial.print(value); Serial.print("/");
  EEPROM.update(id, value);
}
void coinsclear(byte id) {
  EEPROM.write(id,0);

}
