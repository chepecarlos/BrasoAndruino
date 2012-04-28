#include <Servo.h>

int PoxX = 90;    //Variable de la posicion orizontal del joystick
int VecX = 0;     //Variale de hacia donde esta inclinado

void setup() {
  Serial.begin(9600);//Inicar el puerto serial
 
   for( int i = 2; i <= 6 ; i++){
      pinMode( i , INPUT);  
      digitalWrite( i, HIGH);
    }
}

void loop() {
  
}
