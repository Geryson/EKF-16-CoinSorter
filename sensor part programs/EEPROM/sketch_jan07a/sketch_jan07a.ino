#include <EEPROM.h>

bool van_erme = true;
int address = 0;
byte value;

void setup() {Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
 
}

void loop() {
  
  while (van_erme) {
    //erme vizsgálat hogy milyen érme van
    
    //cimek:0-5-ig 5-200-ig növekvősorrendbe

    int erme_neve = 20; //ide a megvizsgált érme neve kell (5-200)

    switch(erme_neve) {
      
      case 5: coinsmodify(0, EEPROM.read(0)+1);
      break;

      case 10: coinsmodify(1, EEPROM.read(1)+1);
      break;

      case 20: coinsmodify(2, EEPROM.read(2)+1);
      break;

      case 50: coinsmodify(3, EEPROM.read(3)+1);
      break;

      case 100: coinsmodify(4, EEPROM.read(4)+1);
      break;

      case 200: coinsmodify(5, EEPROM.read(5)+1);
      break;
    }
   value = EEPROM.read(address);

  Serial.print(address);
  Serial.print("\t");
  Serial.print(value, DEC);
  Serial.println();

 
  address = address + 1;
  if (address == 6) {
    address = 0;
  }

  delay(500);
  }
  
}



bool coinsmodify(byte id, byte value) {
  EEPROM.update(id, value);
}
void coinsclear(byte id, byte value) {
    EEPROM.write(id, value);
    
}

byte coinsread() {
  byte ermek[6];
  ermek[0] = EEPROM.read(0);
  ermek[1] = EEPROM.read(1);
  ermek[2] = EEPROM.read(2);
  ermek[3] = EEPROM.read(3);
  ermek[4] = EEPROM.read(4);
  ermek[5] = EEPROM.read(5);
  return *ermek;
}
