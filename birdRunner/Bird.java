public class Bird{
    public double velocity;
    public double fall;
    public float xPos;
    public float yPos;
    public double maxFall;
    public Bird(float x, float y){
        velocity = 0;
        xPos = x;
        yPos = y;
    }
    public void changeVelocity(double newV){velocity = newV;}
    public void move(){
    xPos+=velocity;
    if(velocity > 0){
    velocity -= 0.0075;}
    if(yPos < 490){
    yPos -= fall;
    fall-= 0.05;
    }else{
      fall = maxFall/2;
      yPos -= fall;
      if(maxFall - 1 > 0){
      maxFall -= 1;
      }else{
        maxFall = 0;
      }
    }
  }
  
}
