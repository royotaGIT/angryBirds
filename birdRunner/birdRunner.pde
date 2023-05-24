import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
ArrayList<Pig> pigs;
public Prediction one, two, three, four;
ArrayList<Prediction> predictions;
public Obstacle obstacle;
ArrayList<Obstacle> o;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
    textAlign(CENTER);
    rectMode(CORNERS);
    background(255);
    gavin = new Bird(150, 400);
    g = loadImage("download.png");
    b = loadImage("b.png");
    p = loadImage("pig.png");
    Pig johnny = new Pig(750, 480);
    pigs = new ArrayList<Pig>();
    pigs.add(johnny);
    one = new Prediction(gavin);
    two = new Prediction(gavin);
    three = new Prediction(gavin);
    four = new Prediction(gavin);
    predictions = new ArrayList<Prediction>();
    predictions.add(one);
    predictions.add(two);
    predictions.add(three);
    predictions.add(four);
    obstacle = new Obstacle(500, 400, 700);
    o = new ArrayList<Obstacle>();
    o.add(obstacle);
}
public void draw(){
    image(b,700,300);
    textSize(30);
    fill(0);
    text(points, 1200, 40);
    strokeWeight(10);
    line(150, 500, 150, 400);
    image(g,gavin.x,gavin.y);
    for(int i = 0; i < pigs.size(); i++){
      Pig x = pigs.get(i);
      image(p, x.x, x.y);
      if((gavin.x + 30 > x.x && gavin.x - 30 < x.x)&&(gavin.y + 30 > x.y && gavin.y-30 < x.y)){
      pigs.remove(i);
      points+=5000;
      i--;
      }
    }
    for(int i = 0; i < o.size(); i++){
      Obstacle y = o.get(i);
      if(((gavin.x + 15 > y.LX && gavin.x < y.LX)&&(gavin.y < y.b && gavin.y+30 > y.t))&& !gavin.done){
        if(gavin.velocity > 5){
        o.remove(i);
        i--;
        points += 100;
        gavin.velocity -= 3;
        }else{
        gavin.velocity = 0;
        gavin.done = true;
      }
      }else{
      fill(150, 75, 0);
      strokeWeight(1);
      rect(y.LX, y.b, y.LX + 10, y.t);
      }
    }
    if(draw && mouseX < 150 && !inFlight){
    gavin.x = mouseX; 
    if(mouseY < 490){
    gavin.y = mouseY;
    }else{gavin.y = 489;}
    strokeWeight(5);
    line(150,400,gavin.x - 10, gavin.y + 10);
    for(int i = 0; i < predictions.size(); i++){
      Prediction x = predictions.get(i);
      x.frames = (int)((400-mouseX) * i / 25 + 25);
      x.update(gavin);
      if(x.y < 490){
      fill(255);
      strokeWeight(2);
      circle(x.x,x.y,10);
      }
    }
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
  gavin.velocity = (150 - mouseX)/15;
  gavin.vert = (gavin.y - 400)/15;
  }
}
