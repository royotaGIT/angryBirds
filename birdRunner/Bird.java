public class Bird{
    public double velocity;
    public double vert;
    public float xPos;
    public float yPos;
    public boolean done;
    public Bird(float x, float y){
        velocity = 0;
        xPos = x;
        yPos = y;
        done = false;
    }
    public void changeVelocity(double newV){velocity = newV;}
    public void move(){
    xPos+=velocity;
    if(velocity > 0){
      if(yPos < 490){
         velocity -= 0.0075;
       }else{
         velocity -= 0.03;
       }
    }else if(velocity < 0){velocity = 0;}
    else if(!done){done = true;}
    if(yPos<490){
    vert -= 0.05;
    }else if(Math.abs(vert) > 0.5){
    vert = vert * -0.5;
    yPos -= vert;
    }else{
      vert = 0;
      yPos = 490;
    }
    yPos -= vert;
    }
}
