void setup()
{
  pinMode(7,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(9,OUTPUT);
}
void loop()

{
  analogWrite(9,210);
  digitalWrite(7,HIGH);
  digitalWrite(6,LOW);
}
