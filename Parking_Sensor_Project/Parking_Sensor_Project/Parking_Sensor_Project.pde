import processing.serial.*;

Serial mySerial;

String readString = null;
float distanceRear;
float distanceFront;
float pixelsRear;
float pixelsFront;

PImage bg;


void setup() {
  size (1800, 540);
  bg = loadImage("G30.jpg");
  background(bg);
  fill(56, 56, 56);
  stroke(56, 56, 56);
  rect(1600, 120, 45, 300, 5, 100, 100, 5);
  rect(1660, 95, 45, 350, 5, 100, 100, 5);
  rect(1720, 70, 45, 400, 5, 100, 100, 5);
  
  rect(30, 70, 45, 400, 100, 5, 5, 100);
  rect(90, 95, 45, 350, 100, 5, 5, 100);
  rect(150, 120, 45, 300,100, 5, 5, 100);
  
  int lastport = Serial.list().length;
  String myPort = Serial.list()[lastport-1];
  mySerial = new Serial (this, myPort, 9600);
  

}

void draw() {
  if (mySerial.available() > 0) {
    readString = mySerial.readString();
    
    println("--------------------------------------\n" + readString);
    
    if (readString != null){
      String[] strings = readString.split("\n", 4);
      
      if (strings[0].contains("REAR")){
        distanceRear = float(strings[1]);
      }
      
      if (strings[2].contains("FRONT")){
        distanceFront = float(strings[3]);
      }
    
      if (!Float.isNaN(distanceRear)){
        pixelsRear = (3 - (distanceRear  % 3 )) * 15;
        
        fill(56, 56, 56);
        stroke(56, 56, 56);
        rect(1600, 120, 45, 300);
        rect(1660, 95, 45, 350);
        rect(1720, 70, 45, 400);
    
        if (distanceRear >= 6 && distanceRear < 9){
          fill(0,255,0);
          stroke(0, 255, 0);
          rect(1720 + 45 - pixelsRear, 70, pixelsRear, 400,  0, 100, 100, 0);
        }
      
        else if (distanceRear >= 3 && distanceRear < 6){
          fill(255,255,0);
          stroke(255,255,0);
          rect(1720, 70, 45, 400,  5, 100, 100, 5);
          rect(1660 + 45 - pixelsRear, 95, pixelsRear, 350,  5, 100, 100, 5);
        }
      
        else if (distanceRear >= 0 && distanceRear < 3){
          fill(255,0,0);
          stroke(0);
          rect(1720, 70, 45, 400,  5, 100, 100, 5);
          rect(1660, 95, 45, 350,  5, 100, 100, 5);
          rect(1600 + 45 - pixelsRear, 120, pixelsRear, 300,  5, 100, 100, 5);
        }
      
        else {
          fill(56, 56, 56);
          stroke(56, 56, 56);
          rect(1600, 120, 45, 300);
          rect(1660,95, 45, 350);
          rect(1720, 70, 45, 400);
        }
      }
      
      if(!Float.isNaN(distanceFront)){
          
        pixelsFront = (3 - (distanceFront  % 3 )) * 15;
        
        fill(56, 56, 56);
        stroke(56, 56, 56);
        rect(30, 70, 45, 400);
        rect(90, 95, 45, 350);
        rect(150, 120, 45, 300);
        
        if (distanceFront >= 6 && distanceFront < 9){
          fill(0,255,0);
          stroke(0,255,0);
          rect(30, 70, pixelsFront, 400, 100, 5, 5, 100);
        }
      
        else if (distanceFront >= 3 && distanceFront < 6){
          fill(255,255,0);
          stroke(255,255,0);
          rect(30, 70, 45, 400, 100, 5, 5, 100);
          rect(90, 95, pixelsFront, 350, 100, 5, 5, 100);
        }
      
        else if (distanceFront >= 0 && distanceFront < 3){
          fill(255,0,0);
          stroke(255,0,0);
          rect(30, 70, 45, 400, 100, 5, 5, 100);
          rect(90, 95, 45, 350, 100, 5, 5, 100);
          rect(150, 120, pixelsFront, 300, 100, 5, 5, 100);
        }
      
        else {
          fill(56, 56, 56);
          stroke(56, 56, 56);
          rect(30, 70, 45, 400);
          rect(90, 95, 45, 350);
          rect(150, 120, 45, 300);
        }
      }
    }
    
  }
}
