//Ameba trigger

//Declaracion de libreria
import TUIO.*;

//Declaracion de las imagenes 
PImage vangogh, hokusai, glitchs, jacaranda, eye;

//Declaracion de variables para accionar las imagenes
int r = 5;
int q = 5;

//Declaracion de variables para la posicion de las imagenes en el sketch
float x, y;

//Declaracion de objeto para accionar TUIO con reacTIVision
TuioProcessing tuioClient;

void setup(){
  //Tamaño del sketch
  size(1000,1000);
  //Inicializacion del sketch
  tuioClient = new TuioProcessing(this);
  //Inicializacion de las imagenes
  vangogh = loadImage("vangogh.png");
  hokusai = loadImage("hokusai.png");
  glitchs = loadImage("glitchs.png");
  jacaranda = loadImage("jacaranda.png");
  eye = loadImage("eye.png");
  
}

void draw(){
  
  //Color del fondo
  background(0);
  //Punto focal de la imagen
  imageMode(CENTER);
  //Punto focal del texto
  textAlign(CENTER);
  //Tamaño del texto
  textSize(20);
  
  /*
  Switch en donde cada que aparece un ID, "r" obtiene un valor y el case se ejecuta
  mostrando la imagen
  */

  switch(r){
    //vangogh
    case 0 :
    PImage image = vangogh;
    image(image,x,y);
    break;
    //hokusai
    case 1:
    image = hokusai;
    image(image,x,y);
    break;
    //glitch
    case 2 :
    image = glitchs;
    image(image,x,y);
    break;
    //jacaranda
    case 3 :
    image = jacaranda;
    image(image,x,y);
    break;
    //eye
    case 4 :
    image = eye;
    image(image,x,y);
    break;
  }
  
  
   switch(q){
    //vangogh
    case 0 :
    text("Almond blossom",x,y);
    text("by Vincent Van Gogh",x,y+20);
    text("painted in 1890",x,y+40);
    break;
    //hokusai
    case 1:
    text("On the trail",x,y);
    text("by Hokusai",x,y+20);
    break;
    //glitch
    case 2 :
    text("glitch",x,y);
    text("The destruction of a file",x,y+20);
    text("by yonmaii",x,y+40);
    break;
    //jacaranda
    case 3 :
    text("jacaranda",x,y);
    text("Jacaranda mimosifolia",x,y+20);
    text("nativa de Mèxico",x,y+40);
    break;
    //eye
    case 4 :
    text("eye",x,y);
    text("un simple ojo", x, y);
    break;
  }
  
}

void addTuioObject(TuioObject tobj) {
  println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  
}

void updateTuioObject (TuioObject tobj) {
  
/*
Valores de las variables "x" y "y", ambas estan relacionadas con la posicion del 
marcador en el campo de vision de la camara web
*/
  x = tobj.getScreenX(width);
  y = tobj.getScreenY(height);
  
 
/*
Acceso a las imagenes, cuando aparece la ameba con cierto ID, aparece la imagen 
dentro del sketch.
Despues se registra el angulo de la ameba y cuando alcanza cierto valor, se mostrara
el texto.
*/
   if(tobj.getSymbolID() == 0){
     r = 0;
     float angle = round(tobj.getAngle());
     if(angle == 5){
       r = 5;
       q = 0;
     }else{
       q = 5;
     }
   }
   
   if(tobj.getSymbolID() == 1){
     r = 1;
     float angle = round(tobj.getAngle());
     if(angle == 5){
       r = 5;
       q = 1;
     }else{
       q = 5;
     }
   }
   
   if(tobj.getSymbolID() == 2){
     r = 2;
     float angle = round(tobj.getAngle());
     if(angle == 5){
       r = 5;
       q = 2;
     }else{
       q = 5;
     }
   }
   
   if(tobj.getSymbolID() == 3){
     r = 3;
     float angle = round(tobj.getAngle());
     if(angle == 5){
       r = 5;
       q = 3;
     }else{
       q = 5;
     }
   }
   
   if(tobj.getSymbolID() == 4){
   r = 4;
   float angle = round(tobj.getAngle());
     if(angle == 5){
       r = 5;
       q = 4;
     }else{
       q = 5;
     }  
   }
}

void removeTuioObject(TuioObject tobj) {
  
  //Cuando desparece la ameba, "r" toma un valor fuera del switch para que la pantalla
  //quede negra
  
  if(tobj.getSymbolID() == 0) r = 5;
  if(tobj.getSymbolID() == 1) r = 5;
  if(tobj.getSymbolID() == 2) r = 5;
  if(tobj.getSymbolID() == 3) r = 5;
  if(tobj.getSymbolID() == 4) r = 5;
  
}
