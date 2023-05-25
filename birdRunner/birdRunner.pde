import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
ArrayList<Pig> pigs;
public Prediction one, two, three, four, five, six, seven;
ArrayList<Prediction> predictions;
public Obstacle obstacle, obstacle2, obstacle3, obstacle4, obstacle5, obstacle6;
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
    Pig johnny = new Pig(750, 478);
    Pig jerry = new Pig(750, 368);
    Pig jacob = new Pig(750, 258);
    pigs = new ArrayList<Pig>();
    pigs.add(johnny);
    pigs.add(jerry);
    pigs.add(jacob);
    one = new Prediction(gavin);
    two = new Prediction(gavin);
    three = new Prediction(gavin);
    four = new Prediction(gavin);
    five = new Prediction(gavin);
    six = new Prediction(gavin);
    seven = new Prediction(gavin);
    predictions = new ArrayList<Prediction>();
    predictions.add(one);
    predictions.add(two);
    predictions.add(three);
    predictions.add(four);
    predictions.add(five);
    predictions.add(six);
    predictions.add(seven);
    obstacle = new Obstacle(500, 400, 700, 10);
    obstacle2 = new Obstacle(400, 390, 690, 130);
    obstacle3 = new Obstacle(500, 400, 800, 10);
    obstacle4 = new Obstacle(390, 290, 700, 10);
    obstacle5 = new Obstacle(290, 280, 690, 130);
    obstacle6 = new Obstacle(390, 290, 800, 10);
    o = new ArrayList<Obstacle>();
    o.add(obstacle);
    o.add(obstacle2);
    o.add(obstacle3);
    o.add(obstacle4);
    o.add(obstacle5);
    o.add(obstacle6);
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
      if(((gavin.x + 15 > y.LX && gavin.x < y.LX + y.w)&&(gavin.y < y.b && gavin.y+30 > y.t))&& !gavin.done){
        if(gavin.velocity > 5){
        gavin.velocity -= 3;
        o.remove(i);
        i--;
        points += 100;}
        else if(gavin.vert < -2){
          gavin.vert += 2;
          o.remove(i);
          i--;
          points+=1000;
          break;
        }else{
        y.fS = gavin.velocity;
        gavin.velocity = 0;
        gavin.done = true;
        y.falling = true;
      }
      }
      fill(150, 75, 0);
      strokeWeight(1);
      if(y.falling){
        quad(y.LX + cos(radians(90 - y.fallCount))*10, y.b - sin(radians(y.fallCount))*10,
              (y.LX + y.w + cos(radians(90 - y.fallCount))*100) - 10 * sin(radians(90 - y.fallCount)), (y.t + sin(radians(y.fallCount))*100) - 10 * sin(radians(y.fallCount)),
              y.LX + y.w + cos(radians(90 - y.fallCount))*100, y.t + sin(radians(y.fallCount))*100,
              y.LX + y.w, y.b);
         if(y.fallCount < 90){y.fallCount+=y.fS;}
         else{o.remove(i);}
      }else{
      rect(y.LX, y.b, y.LX + y.w, y.t);
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
      x.frames = (int)((400-mouseX) * i / 25 + 15);
      x.update(mouseX, mouseY);
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
  if(!gavin.done){
  draw = true;
  }else{
    inFlight = false;
    gavin.x = 175;
    gavin.y = 375;
    draw = true;
    gavin.done = false;
  }
}
public void mouseReleased(){
  draw = false;
  if(!inFlight){
  inFlight = true;
  gavin.velocity = (175 - mouseX)/15;
  gavin.vert = (mouseY - 375)/15;
  }
}
public void keyPressed(){
  noLoop();
}
