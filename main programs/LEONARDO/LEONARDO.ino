
#include <Adafruit_GFX.h>    // Core graphics library
#include <Adafruit_TFTLCD.h> // Hardware-specific library

#include <EEPROM.h>

#define LCD_CS A3 // Chip Select goes to Analog 3
#define LCD_CD A2 // Command/Data goes to Analog 2
#define LCD_WR A1 // LCD Write goes to Analog 1
#define LCD_RD A0 // LCD Read goes to Analog 0

#define LCD_RESET A4 // Can alternately just connect to Arduino's reset pin

#define BLACK   0x0000
#define BLUE    0x001F
#define RED     0xF800
#define GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

Adafruit_TFTLCD tft(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET);

//változók:

//bool van_erme = false;
//bool van_erme_kivetel = false;
int value;
//int coinsnumber[6]; //a felhasználó által megadott értékek eltárolására (csak ki kérni való érmékhez)
int ermekertekkel[7];
int ermedb[6];


void setup() {
  Serial.begin(9600);
  Serial.println(F("TFT LCD test"));
  Serial1.begin(9600);

#ifdef USE_ADAFRUIT_SHIELD_PINOUT
  Serial.println(F("Using Adafruit 2.8\" TFT Arduino Shield Pinout"));
#else
  Serial.println(F("Using Adafruit 2.8\" TFT Breakout Board Pinout"));
#endif

  Serial.print("TFT size is "); Serial.print(tft.width()); Serial.print("x"); Serial.println(tft.height());

  tft.reset();

  uint16_t identifier = tft.readID();
  if (identifier = 101) {
    identifier = 0x9341;
  }

  if (identifier == 0x9325) {
    Serial.println(F("Found ILI9325 LCD driver"));
  } else if (identifier == 0x9328) {
    Serial.println(F("Found ILI9328 LCD driver"));
  } else if (identifier == 0x7575) {
    Serial.println(F("Found HX8347G LCD driver"));
  } else if (identifier == 0x9341) {
    Serial.println(F("Found ILI9341 LCD driver"));
  } else if (identifier == 0x8357) {
    Serial.println(F("Found HX8357D LCD driver"));
  } else {
    Serial.print(F("Unknown LCD driver chip: "));
    Serial.println(identifier, HEX);
    Serial.println(F("If using the Adafruit 2.8\" TFT Arduino shield, the line:"));
    Serial.println(F("  #define USE_ADAFRUIT_SHIELD_PINOUT"));
    Serial.println(F("should appear in the library header (Adafruit_TFT.h)."));
    Serial.println(F("If using the breakout board, it should NOT be #defined!"));
    Serial.println(F("Also if using the breakout, double-check that all wiring"));
    Serial.println(F("matches the tutorial."));
    return;
  }

  tft.begin(identifier);
  tft.setRotation(1);

  welcome();

  for (int i=0; i <10; i++) {
    coinsclear(i);
  }
}


void loop() {
  tft.setRotation(1);

//Serial.println(); Serial.println(analogRead(A5));
  int solar_sum = 0;
for (int i =0; i< 10; i++) {
 solar_sum += analogRead(A5);
}
  int solar = solar_sum / 10;
  Serial.println(solar);
  coinsput(solar);
/*
  while (digitalRead(11) == 1) //tilt sensor
  {
  tft.setCursor(1, 200);
  tft.setTextColor(CYAN); tft.setTextSize(1);
  tft.println("In progress"); 
  }
  tft.fillRect(1, 200, 400, 30, BLACK);
  */

}


bool coinsput(int solar)
{
  bool van_erme = false;
  if ( solar < 100 ) {
   van_erme = true;
  }
  bool r = false;
  if (van_erme) {
    r = true;
  }
  while (van_erme) {
    //erme vizsgálat hogy milyen érme van

    //cimek:0-5-ig 5-200-ig növekvősorrendbe
    //6 -> össz érme


    String erme_neve = ""; //ide a megvizsgált érme neve kell (5-200)

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

bool tele = true;
coinsread();
    if (ermedb[0] < 10 && ermedb[1] < 10 && ermedb[2] < 10 && ermedb[3] < 10 && ermedb[4] < 10 && ermedb[5] < 10)
  {
    coinsadd(erme_neve.toInt()); tele = false;
    coin_state(erme_neve, tele);
  }
   

    van_erme = false;
    
  
  }

  return r;
}

unsigned long coin_state(String erme_neve, bool tele) {
  unsigned long start = micros();
  tft.fillRect(1, 115, 100, 30, BLACK);
  tft.fillRect(150, 150, 90, 30, BLACK);
  tft.fillRect(1, 40, 200, 20, BLACK); // a szép napot szöveget kellene törölnie
  tft.setCursor(1, 1);
  tft.setTextColor(WHITE);  tft.setTextSize(4);
  tft.println("Coin Sorter");
  
  if (tele) {
  tft.setCursor(1, 40);
  tft.setTextColor(YELLOW); tft.setTextSize(2);
  tft.println("Tele van az egyik tarolo");
  }
  tft.setCursor(1, 60);
  tft.setTextColor(BLUE); tft.setTextSize(2);
  tft.println("Lassuk mennyi penzed van"); 
  tft.setCursor(1, 80);
  tft.setTextColor(WHITE);  tft.setTextSize(4);
  tft.println("Actual coin:");
  tft.setCursor(1, 115);
  tft.setTextColor(RED); tft.setTextSize(4);
  tft.print(erme_neve); 
  tft.setCursor(100, 115); tft.setTextColor(WHITE); tft.setTextSize(3); tft.println(" FT");
  tft.setCursor(1, 150);
  tft.setTextColor(WHITE); tft.setTextSize(3);
  sumcoins();
  tft.print("Osszesen:"); tft.setTextColor(RED); tft.print(ermekertekkel[6]);
  tft.setCursor(230, 150); tft.setTextColor(WHITE); tft.setTextSize(3); tft.print(" FT");

  tft.fillRect(1, 180, 250, 30, BLACK); //ha lesz idő lehet szépíteni is
  tft.setCursor(1, 180); tft.setTextSize(1);
  coinsread();
  tft.setTextColor(GREEN); tft.print("5:"); tft.setTextColor(CYAN); tft.print(ermedb[0]);
  tft.setTextColor(GREEN); tft.print(" 10:"); tft.setTextColor(CYAN); tft.print(ermedb[1]);
  tft.setTextColor(GREEN); tft.print(" 20:"); tft.setTextColor(CYAN); tft.print(ermedb[2]);
  tft.setTextColor(GREEN); tft.print(" 50:"); tft.setTextColor(CYAN); tft.print(ermedb[3]);
  tft.setTextColor(GREEN); tft.print(" 100:"); tft.setTextColor(CYAN); tft.print(ermedb[4]);
  tft.setTextColor(GREEN); tft.print(" 200:"); tft.setTextColor(CYAN); tft.print(ermedb[5]);

    return micros() - start;
}



unsigned long welcome() {
  tft.fillScreen(BLACK);
  unsigned long start = micros();
  tft.setCursor(1, 1);
  tft.setTextColor(WHITE);  tft.setTextSize(4);
  tft.println("Coin Sorter");
  tft.setCursor(1, 40);
  tft.setTextColor(YELLOW); tft.setTextSize(2);
  tft.println("Szep napot!");
  tft.setCursor(1, 60);
  tft.setTextColor(BLUE); tft.setTextSize(2);
  tft.println("Lassuk mennyi penzed van");   

  return micros() - start;
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
    value = ermekertekkel[6];

  Serial.print("Osszesen");
  Serial.print("\t");
  Serial.print(value, DEC);
  Serial.println();
  
}


/*
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
*/
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

/*
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
*/
bool coinsmodify(byte id, byte value) {
  Serial.print(id); Serial.print("_"); Serial.print(value); Serial.print("/");
  EEPROM.update(id, value);
}
void coinsclear(byte id) {
  EEPROM.write(id,0);

}

void coinsread() {
  ermedb[0] = EEPROM.read(0);
  ermedb[1] = EEPROM.read(1);
  ermedb[2] = EEPROM.read(2);
  ermedb[3] = EEPROM.read(3);
  ermedb[4] = EEPROM.read(4);
  ermedb[5] = EEPROM.read(5);

}
