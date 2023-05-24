public class Obstacle{
  public float b;
  public float t;
  public float LX;
  public float fall;
  public boolean falling;
  public int fallCount = 0;
  public Obstacle(float bottom, float top, float leftX){
    b = bottom;
    t = top;
    LX = leftX;
  }
}
