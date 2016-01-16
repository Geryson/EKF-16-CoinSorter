
#include <Adafruit_GFX.h>    // Core graphics library
#include <Adafruit_TFTLCD.h> // Hardware-specific library

#define LCD_CS A3 // Chip Select goes to Analog 3
#define LCD_CD A2 // Command/Data goes to Analog 2
#define LCD_WR A1 // LCD Write goes to Analog 1
#define LCD_RD A0 // LCD Read goes to Analog 0

#define LCD_RESET A4 // Can alternately just connect to Arduino's reset pin

#define  BLACK   0x0000
#define BLUE    0x001F
#define RED     0xF800
#define GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

Adafruit_TFTLCD tft(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET);

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

}

 //int sum = 0;
void loop() {
tft.setRotation(1);

//if (! Serial1.available()) {
//while(Serial1.available()){
//  sum+=Serial1.read();

//sum = Serial1.read(); Serial.println(sum, DEC);
//sum2 = String(Serial1.read()); Serial.println(sum2.toInt(), DEC);
/*}
else{

  Serial.println("szar");
}*/
welcome();

delay(2000);

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
  tft.println("Lassuk mennyi penzed van");   Serial.println(F("Lassuk mennyi penzed van :)"));

  return micros() - start;
}
