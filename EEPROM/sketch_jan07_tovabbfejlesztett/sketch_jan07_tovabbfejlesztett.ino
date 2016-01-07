#include <EEPROM.h>

bool van_erme = true;
bool van_erme_kivetel = false;
int address = 0;
byte value;

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

}

void loop() {

  while (van_erme) {
    //erme vizsgálat hogy milyen érme van

    //cimek:0-5-ig 5-200-ig növekvősorrendbe
    //6 -> össz érme

    int erme_neve = 20; //ide a megvizsgált érme neve kell (5-200)

    coinsadd(erme_neve);

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

  int coinfive, cointen, cointwenty, coinfifty, coinhousand, cointwohousand;
  //int ossz_erme_kivetel; //összadja hogy hány db érmét kell összesen kivenni pl.: két 5ft meg négy 10ft az 6 érme
  //ossz_erme_kivetel = coinfive + cointen + cointwenty + coinfifty + counhousand + cointwohousand;

  coinsremove(coinfive, cointen, cointwenty, coinfifty, coinhousand, cointwohousand );
  

}

void coinsadd(int erme_neve)
{
  switch (erme_neve) {

    case 5: coinsmodify(0, EEPROM.read(0) + 1);
      coinsmodify(0, EEPROM.read(6) + 5);
      break;

    case 10: coinsmodify(1, EEPROM.read(1) + 1);
      coinsmodify(0, EEPROM.read(6) + 10);
      break;

    case 20: coinsmodify(2, EEPROM.read(2) + 1);
      coinsmodify(0, EEPROM.read(6) + 20);
      break;

    case 50: coinsmodify(3, EEPROM.read(3) + 1);
      coinsmodify(0, EEPROM.read(6) + 50);
      break;

    case 100: coinsmodify(4, EEPROM.read(4) + 1);
      coinsmodify(0, EEPROM.read(6) + 100);
      break;

    case 200: coinsmodify(5, EEPROM.read(5) + 1);
      coinsmodify(0, EEPROM.read(6) + 200);
      break;
  }
}

void coinsremove(int coinfive, int  cointen, int cointwenty, int coinfifty, int coinhousand, int cointwohousand )
{
  coinsmodify(0, EEPROM.read(0) - coinfive);
  coinsmodify(0, EEPROM.read(6) - 5*coinfive);

  coinsmodify(1, EEPROM.read(1) - cointen);
  coinsmodify(0, EEPROM.read(6) - 10*cointen);

  coinsmodify(2, EEPROM.read(2) - cointwenty);
  coinsmodify(0, EEPROM.read(6) - 20*cointwenty);

  coinsmodify(3, EEPROM.read(3) - coinfifty);
  coinsmodify(0, EEPROM.read(6) - 50*coinfifty);

  coinsmodify(4, EEPROM.read(4) - coinhousand);
  coinsmodify(0, EEPROM.read(6) - 100*coinhousand);

  coinsmodify(5, EEPROM.read(5) - cointwohousand);
  coinsmodify(0, EEPROM.read(6) - 200*cointwohousand);
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
