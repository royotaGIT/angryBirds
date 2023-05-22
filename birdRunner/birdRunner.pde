import java.util.*;
public ArrayList<Bird> birds;
PImage g, b;
boolean draw;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
    background(255);
    birds = new ArrayList<Bird>();
    gavin = new Bird(150, 400);
    birds.add(gavin);
    g = loadImage("download.png");
    b = loadImage("b.png");
}
public void draw(){
    image(b,700,300);
    strokeWeight(10);
    line(150, 500, 150, 400);
    for(Bird x:birds){image(g,x.xPos,x.yPos);}
    if(draw && mouseX < 150){
    gavin.xPos = mouseX; 
    gavin.yPos = mouseY;
    strokeWeight(5);
    line(150,400,gavin.xPos - 10, gavin.yPos + 10);
  }
}
public void mousePressed(){
  draw = true;
}
public void mouseReleased(){
  draw = false;
}
