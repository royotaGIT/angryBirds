public class Bird{
    public double velocity;
    public double vert;
    public float x;
    public float y;
    public boolean done;
    public Bird(float x, float y){
        velocity = 0;
        this.x = x;
        this.y = y;
        done = false;
    }
    public void move(){
    x+=velocity;
    if(velocity > 0){
      if(y < 490){
         velocity -= 0.0075;
       }else{
         velocity -= 0.05;
       }
    }else if(velocity < 0){velocity = 0;}
    else if(!done){done = true;}
    if(y<490){
    vert -= 0.05;
    }else if(Math.abs(vert) > 0.5){
    vert = vert * -0.5;
    y -= vert;
    if(velocity > 0.05){velocity -= 0.05;}
    }else{
      vert = 0;
      y = 490;
    }
    y -= vert;
    }
}
