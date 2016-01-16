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
int value;
int coinsnumber[6]; //a felhasználó által megadott értékek eltárolására (csak ki kérni való érmékhez)
char key;
int ermekertekkel[7];

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
Serial1.begin(9600);
}

bool menustate = true; //ha a menube vagyunk akkor igaz

void loop() {

  key = kpd.getKey();


  //menu



  if (menustate == true)
  {
    if (key == 'A') {
      //Serial1.print('A');
      sumcoins(); //Serial.print(ermekertekkel[6]); //ki is kellene rakni a képernyőre 
      //Serial1.print(ermekertekkel[6]);
      String e = String(ermekertekkel[6]);  /*e.remove(1);*/ 
      menustate == false;
    }
    if (key == 'B') {
      bool sikeres = osszetettkikeres();  //ki kell szedni a menuböl lehet (képernyő)
      menustate == false;
    }
    if (key == 'C') {
      bool sikeres = sumkikeres(); Serial.print( sikeres); //összeg alapján való érme kérés //ha false akkor kiírni a képernyőre hogy nincs elég pénz
      menustate == false;
    }
    if (key == 'D') {
      int solar = analogRead(A0);
  Serial.println(solar);
  coinsput(solar);
      coinsput(solar);  //érme bedobást tervezünk
      menustate == false;
    }

  }
  else {
    if (key == '#') {
      menustate == true;  //vissza kell juttatni a menube
    }
  }


  //menu vege




  if (key) // Check for a valid key.
  {
    Serial.println(key);
  }

 int solar = analogRead(A0);
  Serial.println(solar);
  coinsput(solar);
      coinsput(solar);

  

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

    coinsadd(erme_neve);

    
    Serial.println(erme_neve);


  
  van_erme = false;
    delay(500);
  }

  return r;
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

    value = ermekertekkel[i];

    Serial.print(i);
    Serial.print("\t");
    Serial.print(value, DEC);
    Serial.println();
   //coinsclear(i, 0);

  }
  ermekertekkel[6] = sum;
  value = ermekertekkel[6];

  Serial.print("Osszesen");
  Serial.print("\t");
  //Serial.print(value, DEC);
  Serial.println();
}


bool sumkikeres() //akkor igaz ha a bankba elegendő érme van
{ //összeg alapján akarja ki kérni
  //akkor érméket akar kikérni //már nem szükséges
  key = kpd.getKey(); //nem frissül a key
  bool ciklus2 = true;
  while (ciklus2) {
    key = kpd.getKey();
    
    if (key != NO_KEY) {  //van változás
      Serial.print(key);
      if (key == '*')
      {
        ciklus2 = false;

      }
      if ( key == '#') {
        return false;
      }
      Serial.print(key);
    }
  }

  van_erme_kivetel = true;
  String values;
  bool ciklus = true;
  while (ciklus) {
    key = kpd.getKey();
    if (key != NO_KEY) {
      if ( key == 35) {
        ciklus = false;
      }
      else {
        values = values + (String ) key ; //(String)
      }
       Serial.print(key);
    }

  }
  int val = values.toInt();
  Serial.print(values);
  sumcoins();

  if (val > ermekertekkel[6]) { //biztonsági védelem, hogy ha keveseb az érme mint amit ki kér a felhasználó
    return false;
  }

  coinsnumber[5] = (int) val / 200; if (coinsnumber[5] * 200 <= ermekertekkel[5]) {
    val = val % 200;
  } else {
    coinsnumber[5] = ermekertekkel[5];
    val = val - (ermekertekkel[5]);
  }
  coinsnumber[4] = (int) val / 100; if (coinsnumber[4] * 100 <= ermekertekkel[4]) {
    val = val % 100;
  } else {
    coinsnumber[4] = ermekertekkel[4];
    val = val - (ermekertekkel[4]);
  }
  coinsnumber[3] = (int) val / 50; if (coinsnumber[3] * 50 <= ermekertekkel[3]) {
    val = val % 50;
  } else {
    coinsnumber[3] = ermekertekkel[3];
    val = val - (ermekertekkel[3]);
  }
  coinsnumber[2] = (int) val / 20; if (coinsnumber[2] * 20 <= ermekertekkel[2]) { Serial.println(coinsnumber[2]); Serial.println(ermekertekkel[2]);
    val = val % 20;
  } else {
    coinsnumber[2] = ermekertekkel[2];
    val = val - (ermekertekkel[2]);
  }
  coinsnumber[1] = (int) val / 10; if (coinsnumber[1] * 10 <= ermekertekkel[1]) {
    val = val % 10;
  } else {
    coinsnumber[1] = ermekertekkel[1];
    val = val - (ermekertekkel[1]);
  } Serial.println(val);
  coinsnumber[0] = (int) val / 5; Serial.println(coinsnumber[0]); if (coinsnumber[0] * 5 <= ermekertekkel[0]) {
    val = val % 5; 
  } else {
    coinsnumber[0] = ermekertekkel[0];
    val = val - (ermekertekkel[0]);
  }


  //szeparálás
  Serial.println((String) values);


  int coinfive = coinsnumber[0];
  int cointen = coinsnumber[1];
  int cointwenty = coinsnumber[2];
  int coinfifty = coinsnumber[3];
  int coinhousand = coinsnumber[4];
  int cointwohousand = coinsnumber[5];

  //int ossz_erme_kivetel; //összadja hogy hány db érmét kell összesen kivenni pl.: két 5ft meg négy 10ft az 6 érme
  //ossz_erme_kivetel = coinfive + cointen + cointwenty + coinfifty + counhousand + cointwohousand;

  int x = 0;
  while (6 > x) {
    Serial.print(coinsnumber[x]); Serial.print("__"); x++;  //itt még jó
  }

  coinsremove(coinfive, cointen, cointwenty, coinfifty, coinhousand, cointwohousand );
  return true;
}



bool osszetettkikeres()
{
key = kpd.getKey(); //nem frissül a key
  bool ciklus2 = true;
  while (ciklus2) {
    key = kpd.getKey();
    
    if (key != NO_KEY) {  //van változás
      Serial.print(key);
  //akkor érméket akar kikérni //már nem szükséges
  if ( key == '*')
  {
    ciklus2 = false;

  }
  if ( key == '#') {
        return false;
      }
      Serial.print(key);
    }
  }
    van_erme_kivetel = true;
    String values;
    bool ciklus = true;
  while (ciklus) {
    key = kpd.getKey();
    if (key != NO_KEY) {
      if (key == '*') {  //eredetileg 35 (#)
        ciklus = false;
      }
      else {
        values = values + (String ) key ; //(String)
      }
      Serial.print(key);
    }
      //A szorzás, B összeadás [bevitel először hogy mit és aztán hogy hány darabot]  (pl.: 5A7B20A1 : 7db 5ft-os + 1db 20ft-os)
    }

    Serial.print(values);

   

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
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 1:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 2:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 3:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 4:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 5:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 6:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 7:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 8:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 9:
          if (numberprev == true && sqrprev == false) {
            number = number + n;
          } else {
            if (numberprev == true && sqrprev == true) {
              szorzo[1] = n;
            } else {
              if (sqrprev == false) {
                number = n;
              } else {
                szorzo[0] = n;
              }
            }
          }
          numberprev = true;
          break;

        case 65: //"A" *:
          values[i] = (char) 42;
          numberprev = false;
          sqrprev = true; 
          break;

        case 66: //"B" +:
          values[i] = 43;
          if (numberprev == true) {
            keepdata(number, szorzo); 
            number = "";
            szorzo[0] = -1;
            szorzo[1] = -1;
          }
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
          values[i] = 0;
          if (numberprev == true) {
            keepdata(number, szorzo); 
            number = "";
            szorzo[0] = -1;
            szorzo[1] = -1;
          }
          numberprev = false;
          break;

        case 35: //"#":
          values[i] = 0;
          if (numberprev == true) {
            keepdata(number, szorzo); 
            number = "";
            szorzo[0] = -1;
            szorzo[1] = -1;
          }
          numberprev = false;
          break;

      }
      Serial.println(number + "N");
    }
    //szeparálás
 
  if (coinsnumber[5] > ermekertekkel[5] || coinsnumber[4] > ermekertekkel[4] || coinsnumber[3] > ermekertekkel[3] || coinsnumber[2] > ermekertekkel[2] || coinsnumber[1] > ermekertekkel[1] || coinsnumber[0] > ermekertekkel[0]) {
    return false;
  }

 int x = 0;
  while (6 > x) {
    Serial.print(coinsnumber[x]); Serial.print("__"); x++;  //itt még jó
  }
  
  int coinfive = coinsnumber[0];
  int cointen = coinsnumber[1];
  int cointwenty = coinsnumber[2];
  int coinfifty = coinsnumber[3];
  int coinhousand = coinsnumber[4];
  int cointwohousand = coinsnumber[5];

  //int ossz_erme_kivetel; //összadja hogy hány db érmét kell összesen kivenni pl.: két 5ft meg négy 10ft az 6 érme
  //ossz_erme_kivetel = coinfive + cointen + cointwenty + coinfifty + counhousand + cointwohousand;


  coinsremove(coinfive, cointen, cointwenty, coinfifty, coinhousand, cointwohousand );
  return true;
}

void keepdata(String number, int szorzo[])
{
  if (number == "5") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
  if (number == "10") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
  if (number == "20") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
  if (number == "50") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
  if (number == "100") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
  if (number == "200") {
    if (szorzo[1] > -1 ) {
      coinsnumber[0] = szorzo[0] * 10 + szorzo[1];
    } else {
      coinsnumber[0] = szorzo[0];
    }
  }
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

void coinsremove(int coinfive, int  cointen, int cointwenty, int coinfifty, int coinhousand, int cointwohousand )
{
Serial.print(EEPROM.read(0), DEC); Serial.print("-");
  coinsmodify(0, EEPROM.read(0) - coinfive); Serial.print(EEPROM.read(0), DEC); Serial.print("-"); //konvertálisi hiba?
  coinsmodify(6, EEPROM.read(6) - 5 * coinfive);

  coinsmodify(1, EEPROM.read(1) - cointen);
  coinsmodify(6, EEPROM.read(6) - 10 * cointen);

  coinsmodify(2, EEPROM.read(2) - cointwenty);
  coinsmodify(6, EEPROM.read(6) - 20 * cointwenty);

  coinsmodify(3, EEPROM.read(3) - coinfifty);
  coinsmodify(6, EEPROM.read(6) - 50 * coinfifty);

  coinsmodify(4, EEPROM.read(4) - coinhousand);
  coinsmodify(6, EEPROM.read(6) - 100 * coinhousand);

  coinsmodify(5, EEPROM.read(5) - cointwohousand);
  coinsmodify(6, EEPROM.read(6) - 200 * cointwohousand);

  van_erme_kivetel = false;
  Serial.print(EEPROM.read(0), DEC); Serial.print("-");
}

bool coinsmodify(byte id, byte value) {
  Serial.print(id); Serial.print("_"); Serial.print(value); Serial.print("/");
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
