//Ameba trigger v2

//Declaracion de libreria TUIO
import TUIO.*;
//Declaracion de objeto para que se ejecute junto con reacTIVision
TuioProcessing tuioClient;
//Declaracion de imagenes que se van a ejecutar
PImage vangogh, hokusai, glitchs, jacaranda, eye;

void setup(){
  //Tamaño del sketch
  size(1280,720);
  //Inicializacion del objeto 
  tuioClient  = new TuioProcessing(this);
  //Inicializacion de las imagenes y enlace con archivos respectivos
  vangogh = loadImage("vangogh.png");
  hokusai = loadImage("hokusai.png");
  glitchs = loadImage("glitchs.png");
  jacaranda = loadImage("jacaranda.png");
  eye = loadImage("eye.png");
}

void draw(){
  //Color del fondo
  background(0);
  //Arreglo de objetos en el cual se llamaran a todos los marcadores de referencia con sus caracteristicas
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  //Loop para ejecutar a cada uno 
  for (int i=0;i<tuioObjectList.size();i++) {
    //Inicializacion de objeto para obtener las caracteristicas del arreglo de objetos
     TuioObject tobj = tuioObjectList.get(i);
     //Funciona para que el objeto o grafico que aparezca se mueva, sin afectar a las otras imagenes
     pushMatrix();
     //Mover las coordenadas del sketch a donde aparece la ameba
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     //Rotar en relacion al movimiento de la ameba
     rotate(tobj.getAngle());
     imageMode(CENTER);
     //Cuando aparece cierto ID/ameba que se ejecute la imagen
     if(tobj.getSymbolID() == 0){
       image(jacaranda,0,0);
     }
     if(tobj.getSymbolID() == 1){
       image(eye,0,0);
     }
     if(tobj.getSymbolID() == 2){
       image(vangogh,0,0);
     }
     if(tobj.getSymbolID() == 3){
       image(glitchs,0,0);
     }
     if(tobj.getSymbolID() == 4){
       image(hokusai,0,0);
     }     
     popMatrix();
   }
} 
