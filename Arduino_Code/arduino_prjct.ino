int incomingByte = 0;
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

// the loop function runs over and over again forever
void loop() {
 if (Serial.available() > 0) {
  
  // say what you got:
    if (char(incomingByte) == 'i'){
      Serial.println("Led is on!");
      digitalWrite(LED_BUILTIN, HIGH);
    } else {
     Serial.println("Led is Off");
     digitalWrite(LED_BUILTIN, LOW);
    }
  // read the incoming byte:
  incomingByte = Serial.read();
  }
}
