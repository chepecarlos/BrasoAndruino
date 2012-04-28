#include <Servo.h>

int PoxX = 90;    //Variable de la posicion orizontal del joystick
int VecX = 0;     //Variale de hacia donde esta inclinado
int JoyX = A0;

int ErrorJOY = 30; //Sensiblilidad del braso

void setup() {
  Serial.begin(9600);//Inicar el puerto serial
 
   for( int i = 2; i <= 6 ; i++){
      pinMode( i , INPUT);  
      digitalWrite( i, HIGH);
    }//Iniciando los botones
    
}

void loop() {
  VecX = Movimiento_JOY();
  Serial.println(VecX);
  Serial.println(analogRead(JoyX));
  delay(50);
}

int Movimiento_JOY(){
  int V = analogRead(JoyX);
  if( V - ErrorJOY > 512 )
  return -1;
  else if( V + ErrorJOY < 512 )
  return 1;
  else
  return 0;
  
}
