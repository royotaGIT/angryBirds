import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
ArrayList<Pig> pigs;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
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
    strokeWeight(10);
    line(150, 500, 150, 400);
    image(g,gavin.xPos,gavin.yPos);
    for(Pig x:pigs){
      image(p, x.x, x.y);
    }
    if(draw && mouseX < 150 && !inFlight){
    gavin.xPos = mouseX; 
    if(mouseY < 490){
    gavin.yPos = mouseY;
    }else{gavin.yPos = 489;}
    strokeWeight(5);
    line(150,400,gavin.xPos - 10, gavin.yPos + 10);
  }else if(inFlight && mouseX < 150){
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
  gavin.fall = (gavin.yPos - 400)/15;
  gavin.maxFall = gavin.fall;
  }
}
