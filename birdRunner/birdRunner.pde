import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
ArrayList<Pig> pigs;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
    textAlign(CENTER);
    background(255);
    gavin = new Bird(150, 400);
    g = loadImage("download.png");
    b = loadImage("b.png");
    p = loadImage("pig.png");
    Pig johnny = new Pig(800, 480);
    pigs = new ArrayList<Pig>();
    pigs.add(johnny);
}
public void draw(){
    image(b,700,300);
    textSize(30);
    fill(0);
    text(points, 1200, 40);
    strokeWeight(10);
    line(150, 500, 150, 400);
    image(g,gavin.xPos,gavin.yPos);
    for(int i = 0; i < pigs.size(); i++){
      Pig x = pigs.get(i);
      image(p, x.x, x.y);
      if((gavin.xPos + 30 > x.x && gavin.xPos - 30 < x.x)&&(gavin.yPos + 30 > x.y && gavin.yPos-30 < x.y)){
      pigs.remove(i);
      points+=5000;
      i--;
      }
    }
    if(draw && mouseX < 150 && !inFlight){
    gavin.xPos = mouseX; 
    if(mouseY < 490){
    gavin.yPos = mouseY;
    }else{gavin.yPos = 489;}
    strokeWeight(5);
    line(150,400,gavin.xPos - 10, gavin.yPos + 10);
  }else if(inFlight){
    gavin.move();
  }
}
public void mousePressed(){
  draw = true;
}
public void mouseReleased(){
  draw = false;
  if(!inFlight){
  inFlight = true;
  gavin.velocity = (150 - mouseX)/18;
  gavin.vert = (gavin.yPos - 400)/15;
  }
}
