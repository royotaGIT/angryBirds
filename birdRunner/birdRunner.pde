import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
int lives = 3;
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
    for(int i = 1; i < lives; i ++){
      image(g, 125 - i * 30, 490);
    }
    for(int i = 0; i < pigs.size(); i++){
      Pig x = pigs.get(i);
      boolean support2 = false;
      if(x.y >= 478){support2 = true;}
      for(int r = 0; r < o.size(); r++){
        Obstacle o2 = o.get(r);
        if((Math.abs(x.y + 20 - o2.t) < 3 && (o2.LX < x.x && o2.LX + o2.w > x.x)) || x.y >= 480){
          support2 = true;
        }
      }
      if(!support2){
        x.y += 3;
      }
      image(p, x.x, x.y);

      if((gavin.x + 30 > x.x && gavin.x - 30 < x.x)&&(gavin.y + 30 > x.y && gavin.y-30 < x.y)){
      pigs.remove(i);
      points+=5000;
      i--;
      }
      for(int x2 = 0; x2 < pigs.size(); x2++){
        Pig z = pigs.get(x2);
        if(!(z == x) && (Math.abs(x.y - z.y) < 20 && z.x == x.x)){
          pigs.remove(i);
          i--;
      }
    }
    }
    for(int i = 0; i < o.size(); i++){
      Obstacle y = o.get(i);
      if(((gavin.x + 15 > y.LX && gavin.x < y.LX + y.w)&&(gavin.y < y.b && gavin.y+30 > y.t))&& !gavin.done){
        if(gavin.velocity > 5 || y.w > 10){
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
        y.tip = true;
      }
      }
      fill(150, 75, 0);
      strokeWeight(1);
      if(y.tip){
        quad(y.LX + cos(radians(90 - y.fallCount))*10, y.b - sin(radians(y.fallCount))*10,
              (y.LX + y.w + cos(radians(90 - y.fallCount))*(y.b - y.t)) - y.w * sin(radians(90 - y.fallCount)), (y.t + sin(radians(y.fallCount))*100) - y.w * sin(radians(y.fallCount)),
              y.LX + y.w + cos(radians(90 - y.fallCount))*(y.b - y.t), y.t + sin(radians(y.fallCount))*100,
              y.LX + y.w, y.b);
         if(y.fallCount < 90){y.fallCount+=y.fS;}
         else{o.remove(i);}
      }else{
        boolean support = false;
      for(int r = 0; r < o.size(); r++){
        if((!y.tip &&o.get(r).t == y.b) || y.b >= 500){
          support = true;
        }
      }
      if(!support){
        y.t+=3;
        y.b+=3;
      }
      rect(y.LX, y.b, y.LX + y.w, y.t);
      }
      
    }
    if(draw && mouseX < 175 && !inFlight){
    if(mouseX < 0){mouseX = 0;}
    else{gavin.x = mouseX;} 
    if(mouseY > 490){gavin.y = 490;} 
    else{gavin.y = mouseY;}
    strokeWeight(5);
    line(175,375,gavin.x - 10, gavin.y + 10);
    for(int i = 0; i < predictions.size(); i++){
      Prediction x = predictions.get(i);
      x.frames = (int)((400-mouseX) * i / 25 + 15);
      x.update(mouseX, mouseY);
      fill(255);
      strokeWeight(2);
      circle(x.x,x.y,10);
      
    }
  }else if(inFlight){
    gavin.move();
  }
}
public void mousePressed(){
  if(!gavin.done){
  draw = true;
  }else if(lives > 0){
    inFlight = false;
    gavin.x = 175;
    gavin.y = 375;
    draw = true;
    gavin.done = false;
    lives--;
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
