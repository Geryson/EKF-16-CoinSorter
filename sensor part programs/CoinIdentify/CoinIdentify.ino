//A solar cell bekötése: + -- analóg port (A0), - -- GND

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.println(analogRead(A0)*5);
delay(1000);
}
