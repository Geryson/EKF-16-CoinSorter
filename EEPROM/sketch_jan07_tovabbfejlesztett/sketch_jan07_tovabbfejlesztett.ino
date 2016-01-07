#include <EEPROM.h>
#include <Key.h>
#include <Keypad.h>

//region mátrix
const byte ROWS = 4; // Four rows
const byte COLS = 4; // Three columns
// Define the Keymap
char keys[ROWS][COLS] = {
  {'1', '4', '7', '*'},
  {'2', '5', '8', '0'},
  {'3', '6', '9', '#'},
  {'A', 'B', 'C', 'D'}
};
// Connect keypad ROW0, ROW1, ROW2 and ROW3 to these Arduino pins.
byte rowPins[ROWS] = { 5, 4, 3, 2 };
// Connect keypad COL0, COL1 and COL2 to these Arduino pins.
byte colPins[COLS] = { 9, 8, 7, 6 };

// Create the Keypad
Keypad kpd = Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS );

//endregion

bool van_erme = false;
bool van_erme_kivetel = false;
int address = 0;
byte value;
int coinsnumber[6]; //a felhasználó által megadott értékek eltárolására (csak ki kérni való érmékhez)

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

}

void loop() {

  

  char key = kpd.getKey();
  if (key) // Check for a valid key.
  {
    Serial.println(key);
  }

  if ((String) key == "*") //akkor érméket akar kikérni
  {
    van_erme_kivetel = true;
    String values;
    char keyprevious;
    while ((String) key != "#") {
      keyprevious = key;
      while (key == keyprevious) {}
      values = values + key ; //(String)
      //A szorzás, B összeadás [bevitel először hogy mit és aztán hogy hány darabot]  (pl.: 5A7B20A1 : 7db 5ft-os + 1db 20ft-os)
    }

    bool numberprev = true;
    bool sqrprev = false;
    String number;
    int szorzo[2]; szorzo[0] = -1; szorzo[1] = -1;
    for (int i = 0; i < values.length(); i++)
    {
      int n = values[i];
      switch (n)
      {
        case 0:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 1:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 2:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 3:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 4:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 5:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 6:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 7:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 8:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
         numberprev = true;
          break;

        case 9:
        if(numberprev == true && sqrprev == false) { number = number + n; } else { if (numberprev == true && sqrprev == true) {szorzo[1] = n; } else { if (sqrprev == false) {number = n;} else {szorzo[0] = n;}}}
          numberprev = true;
          break;

        case 65: //"A" *:
          values[i] = (char) 42;
          numberprev = false;
          sqrprev = true;
          break;

        case 66: //"B" +:
          values[i] =43;
          if (numberprev == true) { keepdata(number, szorzo); number = ""; szorzo[0] = -1; szorzo[1]= -1;}
          numberprev = false;
          break;

        case 67: // "C":
          /*nem hordoz fontos értéket jelenleg*/
          numberprev = false;
          break;

        case 68: // "D":
          /*nem hordoz fontos értéket jelenleg*/
          numberprev = false;
          break;

        case  42: //"*":
          /*nem hordoz fontos értéket jelenleg*/
          numberprev = false;
          break;

        case 35: //"#":
          /*nem hordoz fontos értéket jelenleg*/
          numberprev = false;
          break;

      }
    }
    //szeparálás
    Serial.println((String) values);
  }

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

  int coinfive = coinsnumber[0];
  int cointen= coinsnumber[1];
  int cointwenty = coinsnumber[2]; 
  int coinfifty=coinsnumber[3];
  int coinhousand = coinsnumber[4];
  int cointwohousand =coinsnumber[5];

  //int ossz_erme_kivetel; //összadja hogy hány db érmét kell összesen kivenni pl.: két 5ft meg négy 10ft az 6 érme
  //ossz_erme_kivetel = coinfive + cointen + cointwenty + coinfifty + counhousand + cointwohousand;


  coinsremove(coinfive, cointen, cointwenty, coinfifty, coinhousand, cointwohousand );


}

void keepdata(String number, int szorzo[])
{
  if (number == "5") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
  if (number == "10") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
  if (number == "20") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
  if (number == "50") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
  if (number == "100") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
  if (number == "200") { if (szorzo[1] > -1 ) {coinsnumber[0] = szorzo[0]*10 +szorzo[1];} else { coinsnumber[0] = szorzo[0];}}
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
  coinsmodify(0, EEPROM.read(6) - 5 * coinfive);

  coinsmodify(1, EEPROM.read(1) - cointen);
  coinsmodify(0, EEPROM.read(6) - 10 * cointen);

  coinsmodify(2, EEPROM.read(2) - cointwenty);
  coinsmodify(0, EEPROM.read(6) - 20 * cointwenty);

  coinsmodify(3, EEPROM.read(3) - coinfifty);
  coinsmodify(0, EEPROM.read(6) - 50 * coinfifty);

  coinsmodify(4, EEPROM.read(4) - coinhousand);
  coinsmodify(0, EEPROM.read(6) - 100 * coinhousand);

  coinsmodify(5, EEPROM.read(5) - cointwohousand);
  coinsmodify(0, EEPROM.read(6) - 200 * cointwohousand);

  van_erme_kivetel = false;
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
