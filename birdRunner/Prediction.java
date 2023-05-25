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
    velocity = (175 - x)/15;
    vert = (y - 375)/15;
    for(int i = 1; i <= frames; i++){
      this.move();
    }  
}

}
