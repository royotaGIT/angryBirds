public class Prediction{
  public float x;
  public float y;
  public int frames;
  public Prediction(Bird bob){
    x = bob.x;
    y = bob.y;
    frames = 0;
    for(int i = 1; i <= frames; i++){
      x = x + (float)(bob.velocity - (0.0075 * i));
      y = y - (float)(bob.vert - (0.05 * i));
    }
  }
  public void update(Bird bob){
    x = bob.x;
    y = bob.y;
    for(int i = 1; i <= frames; i++){
      x = x + (float)((150 - bob.x)/18 - 0.0075 * i);
      y = y - (float)((bob.y - 400)/15 - 0.05 * i);
    }
  }
}
