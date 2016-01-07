// Arduino Light sensor code created by AR Builder.
void setup() {
  Serial.begin(9600); // Start Serial.
  pinMode(13, OUTPUT);
}

void loop() {
  int A = analogRead(A0);
  Serial.println(A);// Display serial results in serial monitor.
  Serial.println(digitalRead(13));
  if (A<50 ) {     // Change 100 to the number depending on the light in your area.
    digitalWrite(13, LOW);
  }
  
  else {
    digitalWrite(13, HIGH);
  }
  

}
