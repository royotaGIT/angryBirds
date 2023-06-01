import java.util.*;
PImage g, b, p;
boolean draw;
boolean inFlight = false;
int points = 0;
int lives = 3;
boolean notSplit;
Bird zero;
ArrayList<Bird> birds;
ArrayList<Pig> pigs;
public Prediction one, two, three, four, five, six, seven;
ArrayList<Prediction> predictions;
public Obstacle obstacle, obstacle2, obstacle3, obstacle4, obstacle5, obstacle6,
obstacle7, obstacle8, obstacle9, obstacle10, obstacle11;
ArrayList<Obstacle> o;
public Bird gavin;
public void setup(){
    size(1400,600);
    imageMode(CENTER);
    textAlign(CENTER);
    rectMode(CORNERS);
    background(255);
    zero = new Bird(175, 375);
    birds = new ArrayList<Bird>();
    birds.add(zero);
    g = loadImage("download.png");
    b = loadImage("b.png");
    p = loadImage("pig.png");
    Pig johnny = new Pig(750, 478);
    Pig jerry = new Pig(750, 368);
    Pig jacob = new Pig(750, 258);
    Pig jack = new Pig(1005, 368);
    Pig joseph = new Pig(1200, 478);
    pigs = new ArrayList<Pig>();
    pigs.add(johnny);
    pigs.add(jerry);
    pigs.add(jacob);
    pigs.add(jack);
    pigs.add(joseph);
    one = new Prediction(zero);
    two = new Prediction(zero);
    three = new Prediction(zero);
    four = new Prediction(zero);
    five = new Prediction(zero);
    six = new Prediction(zero);
    seven = new Prediction(zero);
    predictions = new ArrayList<Prediction>();
    predictions.add(one);
    predictions.add(two);
    predictions.add(three);
    predictions.add(four);
    predictions.add(five);
    predictions.add(six);
    predictions.add(seven);
    obstacle = new Stone(500, 400, 700, 10);
    obstacle2 = new Stone(400, 390, 690, 130);
    obstacle3 = new Stone(500, 400, 800, 10);
    obstacle4 = new Obstacle(390, 290, 700, 10);
    obstacle5 = new Obstacle(290, 280, 690, 130);
    obstacle6 = new Obstacle(390, 290, 800, 10);
    obstacle7 = new Obstacle(500, 400, 1000, 10);
    obstacle8 = new Obstacle(400, 390, 940, 130);
    obstacle9 = new Stone(500, 400, 1150, 10);
    obstacle10 = new Obstacle(500, 400, 1250, 10);
    obstacle11 = new Obstacle(400, 390, 1140, 130);
    o = new ArrayList<Obstacle>();
    o.add(obstacle);
    o.add(obstacle2);
    o.add(obstacle3);
    o.add(obstacle4);
    o.add(obstacle5);
    o.add(obstacle6);
    o.add(obstacle7);
    o.add(obstacle8);
    o.add(obstacle9);
    o.add(obstacle10);
    o.add(obstacle11);
}
public void draw(){
    image(b,700,300);
    textSize(30);
    fill(0);
    text(points, 1200, 40);
    strokeWeight(10);
    line(175, 500, 175, 375);
    for(int i = 1; i < lives; i ++){
      image(g, 125 - i * 30, 490);
    }
    for(int z = 0; z < birds.size(); z++){
      Bird gavin = birds.get(z);
    image(g,gavin.x,gavin.y);
    
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
        x.y += 1;
      }
      image(p, x.x, x.y);

      if((gavin.x + 30 > x.x && gavin.x - 30 < x.x)&&(gavin.y + 30 > x.y && gavin.y-30 < x.y)){
      pigs.remove(i);
      points+=5000;
      i--;
      }
      for(int x2 = 0; x2 < pigs.size(); x2++){
        Pig h = pigs.get(x2);
        if(!(h == x) && (Math.abs(x.y - h.y) < 20 && h.x == x.x)){
          pigs.remove(i);
          i--;
      }
    }
    }
    for(int i = 0; i < o.size(); i++){
      Obstacle y = o.get(i);
      if(((gavin.x + 15 > y.LX && gavin.x < y.LX + y.w)&&(gavin.y < y.b && gavin.y+30 > y.t))&& !gavin.done){
        if(gavin.velocity > y.threshold || y.w > 10){
        gavin.velocity -= y.slow;
        o.remove(i);
        i--;
        points += 100;
      //}
        //else if(gavin.vert < -2){
        //  gavin.vert += 2;
        //  o.remove(i);
        //  i--;
        //  points+=1000;
        //  break;
        }else{
          if(y instanceof Stone){
            if(gavin.velocity > y.threshold * 0.8){
              y.fS = gavin.velocity/15;
              y.tip = true;
            }
          }else{
          if(gavin.velocity > y.threshold/2){
            y.fS = gavin.velocity/3;
            y.tip = true;
        }
          }
        gavin.velocity = 0;
        gavin.done = true;
        if(gavin != zero){
        birds.remove(z);
        z--;
      }
        }
      }
      fill(150, 75, 0);
      if(y instanceof Stone){
        fill(128, 128, 128);
      }
      strokeWeight(1);
      if(y.tip){
        quad(y.LX + cos(radians(90 - y.fallCount))*10, y.b - sin(radians(y.fallCount))*10,
              (y.LX + y.w + cos(radians(90 - y.fallCount))*(y.b - y.t)) - y.w * sin(radians(90 - y.fallCount)), (y.t + sin(radians(y.fallCount))*100) - y.w * sin(radians(y.fallCount)),
              y.LX + y.w + cos(radians(90 - y.fallCount))*(y.b - y.t), y.t + sin(radians(y.fallCount))*100,
              y.LX + y.w, y.b);
         if(y.fallCount < 90){y.fallCount+=5;}
         else{o.remove(i);}
      }else{
        boolean support = false;
  
      for(int r = 0; r < o.size(); r++){
        Obstacle y2 = o.get(r);
        
        if(((!y2.tip && y2.t == y.b) && ((y2.LX > y.LX && y2.LX < y.LX + y.w)||(y2.LX < y.LX && y2.LX + y2.w > y.LX)))|| y.b >= 500){
          support = true;
        }
      }
      if(!support){
        y.t+=1;
        y.b+=1;
      }
      rect(y.LX, y.b, y.LX + y.w, y.t);
      }
      
    }
    if((draw && mouseX < 175) && !inFlight){
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
}
public void mousePressed(){
  if(!zero.done){draw = true;}
  else if(lives > 0){
    inFlight = false;
    zero.x = 175;
    zero.y = 375;
    draw = true;
    zero.done = false;
    notSplit = true;
    lives--;
    for(int i = 0; i < birds.size(); i++){
      if(birds.get(i)!=zero){
        birds.remove(i);
        i--;
      }
    }
  }
  if(inFlight && zero.x > 175){
    if(notSplit){
      Bird oneSplit = new Bird(zero.x, zero.y);
      Bird twoSplit = new Bird(zero.x, zero.y);
      oneSplit.vert = zero.vert+3;
      twoSplit.vert = zero.vert-3;
      oneSplit.velocity = zero.velocity;
      twoSplit.velocity = zero.velocity;
      birds.add(oneSplit);
      birds.add(twoSplit);
      notSplit = false;
    }
  }
}
public void mouseReleased(){
  draw = false;
  if(!inFlight){
  inFlight = true;
  notSplit = true;
  zero.velocity = (175 - mouseX)/15;
  zero.vert = (mouseY - 375)/12;
  }
}
