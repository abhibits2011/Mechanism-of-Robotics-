const int IN1 = 7;  //Defining the pins of Arduino kit and mapping them to motor driver
const int IN2 = 6;
const int IN3 = 5;  //Defining the pins of Arduino kit and mapping them to motor driver
const int IN4 = 4;
const int ENA = 9;
const int ENB = 10;
int encoderPin1 =2;
int encoderPin2 =3;
volatile int lastEncoded =0;
volatile long encoderValue =0;
volatile int Error =0 ;
volatile int pwm1 =135;
volatile int pwmcopy =0;
long lastencoderValue =0;
int lastMSB =0;
int lastLSB =0;
int rotation=120,Errorcopy,sumerror,differ;
int frw=1;
int sen = 220;
void forward();
void reverse();

void setup() {
Serial.begin(9600);
  pinMode (IN1, OUTPUT);  //Configuring the Arduino pins as output
  pinMode (IN2, OUTPUT);
  pinMode (ENA, OUTPUT);
  pinMode (IN3, OUTPUT);  //Configuring the Arduino pins as output
  pinMode (IN4, OUTPUT);
  pinMode (ENB, OUTPUT);
  
Serial.println("slave");
//Npulses = 1000; //Run the motor for 1000 pulses
  pinMode(encoderPin1, INPUT); 
  pinMode(encoderPin2,INPUT);                                                
//digitalWrite(encoderPin1, HIGH);//turn pullup resistor ON
//digitalWrite(encoderPin2, HIGH);
attachInterrupt(0, updateEncoder, CHANGE);  //interrupt pin number 2
attachInterrupt(1, updateEncoder, CHANGE);  //interrupt pin number 3
}
void loop() {
if(frw == 1)
{
//analogWrite(10,pwm1); 
  analogWrite(9,pwm1);  
  //  digitalWrite(5,LOW);                             //motor rotate Forward direction
 //   digitalWrite(4,HIGH); 
      digitalWrite(6,LOW);                             //motor rotate Forward direction
      digitalWrite(7,HIGH);
Serial.println(encoderValue);
Serial.println(Error);
//Serial.println(pwm1);
//Serial.println(Error);
if(Error<0) 
{
  pwm1=0;
  //pwm1=0;
  if(frw==1) reverse();
  else forward();
  }
}
else if(frw == 2)
{
//analogWrite(10,pwm1); 
  analogWrite(9,pwm1);  
 //     digitalWrite(5,HIGH);                             //motor rotate Reverse direction
 //   digitalWrite(4,LOW); 
      digitalWrite(6,HIGH);                          //motor rotate Reverse direction
      digitalWrite(7,LOW); 
//Serial.println(encoderValue);
Serial.println(Error);
Serial.println(pwm1);
if(Error<0) 
{
  pwm1=0;
  //pwm1=0;
  if(frw==1) reverse();
  else forward();
  }
}
//Serial.println(Error);

else if(frw == 3)
  {
while(digitalRead(8) == HIGH)                          //motor rotate until sensor cut direction
{
  analogWrite(10,65); 
  analogWrite(9,65);
  if(sen < 0)
  {  
    digitalWrite(5,LOW);                             //motor rotate Forward direction
    digitalWrite(4,HIGH); 
      digitalWrite(6,LOW);                             //motor rotate Forward direction
    digitalWrite(7,HIGH); 
    Serial.println(encoderValue);
}
  else if(sen > 0)
  {  
       digitalWrite(5,HIGH);                             //motor rotate Reverse direction
    digitalWrite(4,LOW); 
      digitalWrite(6,HIGH);                          //motor rotate Reverse direction
    digitalWrite(7,LOW); 
    Serial.println(encoderValue);
}
}
analogWrite(10,0);
analogWrite(9,0);
  
  //Serial.println(counter);
  //Serial.println(sen);
  encoderValue=0;
  sen=0;
  frw=0;
}

}

void forward()
{
  while(Error!=0)
  {
analogWrite(10,65); 
  analogWrite(9,65);  
    digitalWrite(5,LOW);                             //motor rotate Forward direction
    digitalWrite(4,HIGH); 
      digitalWrite(6,LOW);                             //motor rotate Forward direction
    digitalWrite(7,HIGH);
Serial.println(encoderValue);
Serial.println(Error);  
}
}
void reverse()
{
  while(Error<0)
  {
analogWrite(10,60); 
  analogWrite(9,60);  
      digitalWrite(5,HIGH);                             //motor rotate Reverse direction
    digitalWrite(4,LOW); 
      digitalWrite(6,HIGH);                          //motor rotate Reverse direction
    digitalWrite(7,LOW); 
Serial.println(encoderValue);
Serial.println(Error);
//Serial.println(pwm1);
}
Serial.println("end");
pwm1=0;
}
void updateEncoder(){
  int MSB = digitalRead(encoderPin1); //MSB = most significant bit
 int LSB = digitalRead(encoderPin2); //LSB = least significant bit

  int encoded = (MSB << 1) |LSB; //converting the 2 pin value to single number
  int sum  = (lastEncoded << 2) | encoded; //adding it to the previous encoded value

  if(sum == 0b1101 || sum == 0b0100 || sum == 0b0010 || sum == 0b1011) encoderValue --;
  if(sum == 0b1110 || sum == 0b0111 || sum == 0b0001 || sum == 0b1000) encoderValue ++;

lastEncoded = encoded; //store this value for next time
//Serial.println("encoderValue");
//Serial.println(encoderValue);
if(frw == 1)
{
Error=(rotation - encoderValue);
}
else
{
Error=(rotation + encoderValue);
}
// if(counter % 2)
// {
  //proportional
sumerror = sumerror + Error;
if(sumerror>500) sumerror = 0;    //reser integral error with max limit
differ = Error - Errorcopy;
//  pwmcopy = (Error*3/16) + (sumerror/16) + (differ/16);

pwmcopy = (Error*3/16) + (sumerror/16) + (differ/16);

if(pwmcopy>150) pwmcopy = 150;

if(pwmcopy<50) pwmcopy = 60;
pwm1 = pwmcopy;
if(Error == 0) pwm1=0;
}
/*sumerror = sumerror +Error;
//if(sumerror>500) sumerror = 0;    //reser integral error with max limit
differ = Error - Errorcopy;
pwmcopy=Error*3/16 + (sumerror/32) + (differ/16);

if(pwmcopy<75) pwmcopy = 75;
if(pwmcopy>225) pwmcopy = 225;
if(Error < 3) pwmcopy=0;
if(Error < 2) pwmcopy=0;
Errorcopy = Error;
pwm1 = pwmcopy;
}
//Serial.println(pwm1);


}*/
