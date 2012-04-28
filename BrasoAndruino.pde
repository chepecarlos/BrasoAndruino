#include <Servo.h>

int PoxX = 90;    //Variable de la posicion orizontal del joystick
int VecX = 0;     //Variale de hacia donde esta inclinado
int JoyX = A0;

int PunteroAura = 1;

int Rango = 10; //Sensiblilidad del braso

Servo ServosLila[7];
int ServoPines[7] = {7, 8, 9, 10, 11, 12, 13};

/*
7 pinza
8 Muneca
9 Mano
10 Codo
11 Ambro 
12 
13 
*/
int EstadoDefaul[6] = { 0, 0, 0, 90, 0, 0};
int EstadoActual[6];
int RangoMin[6] = { 0, 0, 0, 0, 0, 0};
int RangoMax[6] = { 180, 180, 180, 180, 180, 180};

void setup() {
  Serial.begin(9600);//Inicar el puerto serial
 
   for( int i = 2; i <= 6 ; i++){
      pinMode( i , INPUT);  
      digitalWrite( i, HIGH);
    }//Iniciando los botones   
    
   for(int i = 0; i<6; i++){
    ServosLila[i].attach(ServoPines[i]);
    ServosLila[i].write(EstadoDefaul[i]);
    EstadoActual[i] = EstadoDefaul[i];
  }  
  ServosLila[7].attach(ServoPines[6]);
    ServosLila[7].write(EstadoDefaul[6]);
        
}

void loop() {
 
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
   
   
  VecX = Movimiento_JOY();
  CambiarPosicion(VecX);
  Serial.print(VecX);
  Serial.print(" ");
  Serial.print(EstadoActual[PunteroAura]);
  Serial.print(" ");
  Serial.println(PunteroAura);
  delay(100);
  Actualizar();  
}

int Movimiento_JOY(){
  return map( analogRead(JoyX), 0, 1023, -Rango , Rango );
}

void Actualizar(){
   for(int i = 0; i<6; i++){
    ServosLila[i].write(EstadoActual[i]);
  }  
  ServosLila[7].write(EstadoActual[6]);
}

void CambiarPosicion(int x){
  EstadoActual[PunteroAura] = EstadoActual[PunteroAura] + x;
 if (  EstadoActual[PunteroAura] > RangoMax[PunteroAura]) 
     EstadoActual[PunteroAura] = RangoMax[PunteroAura];
  if (  EstadoActual[PunteroAura] < RangoMin[PunteroAura]) 
     EstadoActual[PunteroAura] = RangoMin[PunteroAura];   
   }
