#include <Servo.h>

int PoxX = 90;    //Variable de la posicion orizontal del joystick
int VecX = 0;     //Variale de hacia donde esta inclinado
int JoyX = A0;

int PunteroAura = 0;
int Boton = 1;

int Rango = 10; //Sensiblilidad del braso

float t0 = millis();
float t1 = t0;

void setup() {
  Serial.begin(9600);//Inicar el puerto serial
 
   for( int i = 2; i <= 6 ; i++){
      pinMode( i , INPUT);  
      digitalWrite( i, HIGH);
    }//Iniciando los botones   
}

void loop() {
  VecX = Movimiento_JOY();
 
   if( digitalRead(3) == 0 ){
    PunteroAura++;
    if(PunteroAura > 6) 
    PunteroAura = 1;
    do{
      delay(100);
    }while( digitalRead(3) == 0 );
   }
   if( digitalRead(6) == 0 ){
     PunteroAura--;
     if(PunteroAura < 1 ) 
     PunteroAura = 6;
     do{
       delay(100);
     }while( digitalRead(6) == 0 );
   }
    
  Serial.println(VecX);
  Serial.println(PunteroAura);
  delay(50);
}

int Movimiento_JOY(){
  return map( analogRead(JoyX), 0, 1023, -Rango , Rango );
}
