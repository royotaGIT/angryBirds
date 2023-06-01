public class Prediction extends Bird{
  public float x;
  public float y;
  public int frames;
  public Bird bob;
  public Prediction(Bird bob){
    super(bob.x, bob.y);
    this.bob = bob;
  }
  public void update(float xPos, float yPos){
    x = xPos;
    y = yPos;
    if(y > 490){y = 490;}
    if(x < 0){x = 0;}
    velocity = (175 - x)/15;
    vert = (y - 375)/12;
    for(int i = 1; i <= frames; i++){
      this.move();
    }  
}
 public void move(){
    x+=velocity;
    if(velocity > 0){
      if(y < 490){
         velocity -= 0.0075;
       }else{
         velocity -= 0.3;
       }
    }else if(velocity < 0){velocity = 0;}
    else if(!done){done = true;}
    if(y<490){
    vert -= 0.1;
    }else if(Math.abs(vert) > 0.5){
    vert = vert * -0.3;
    y -= (vert * 2);
      if(velocity > 0.75){velocity -= 0.75;}
      else{
        velocity = 0;
        vert = 0;
      }
    }else{
      vert = 0;
      y = 490;
    }
    y -= vert;
    }

}
