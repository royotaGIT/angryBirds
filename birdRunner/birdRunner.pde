import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
ArrayList<Pig> pigs;
public Prediction one, two, three, four;
ArrayList<Prediction> predictions;
public Obstacle obstacle, obstacle2;
public Platform platform;
ArrayList<Obstacle> o;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
    textAlign(CENTER);
    rectMode(CORNERS);
    background(255);
    gavin = new Bird(175, 375);
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
    obstacle2 = new Obstacle(500, 400, 800);
    platform = new Platform(400, 690, 130);
    o = new ArrayList<Obstacle>();
    o.add(obstacle);
    o.add(obstacle2);
    o.add(platform);
}
public void draw(){
    image(b,700,300);
    textSize(30);
    fill(0);
    text(points, 1200, 40);
    strokeWeight(10);
    line(175, 500, 175, 375);
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
        if((gavin.velocity > 5)||(Math.abs(gavin.vert) > 2)){
        o.remove(i);
        i--;
        points += 100;
        if(gavin.velocity > 3){gavin.velocity -= 3;}
        else{gavin.vert -= 1;}
        }else{
        gavin.velocity = 0;
        gavin.done = true;
      }
      }else{
      fill(150, 75, 0);
      strokeWeight(1);
      if(y.b != 500){
        if(y instanceof Platform){
          Platform x = (Platform)y;
          boolean left = false;
          boolean right = false;
          for(Obstacle z:o){
             if(z.t == x.b){
                if(z.LX > x.LX && z.LX < x.LX + x.w){
                  if(z.LX < x.LX + x.LX/2){left = true;}
                  else{right = true;}
                }
             }
        }if(right && !left){
        x.rlean = true;
      }
      }
      if(!(y instanceof Platform)){
      rect(y.LX, y.b, y.LX + 10, y.t);
      }else{
        Platform x = (Platform)y;
        rect(x.LX, x.b, x.LX + x.w, x.t);
      }
    }
    }
    }
    if(draw && mouseX < 175 && !inFlight){
    gavin.x = mouseX; 
    if(mouseY < 490){
    gavin.y = mouseY;
    }else{gavin.y = 489;}
    strokeWeight(5);
    line(175,375,gavin.x - 10, gavin.y + 10);
    for(int i = 0; i < predictions.size(); i++){
      Prediction x = predictions.get(i);
      x.frames = (int)((350-mouseX) * i / 25 + 15);
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
  gavin.velocity = (175 - mouseX)/10;
  gavin.vert = (mouseY - 375)/10;
  }
}
