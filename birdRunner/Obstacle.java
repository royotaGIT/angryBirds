public class Obstacle{
  public float b;
  public float t;
  public float LX;
  public float fall;
  public float w;
  public boolean falling;
  public int fallCount = 0;
  public Obstacle(float bottom, float top, float leftX, float wide){
    b = bottom;
    t = top;
    w = wide;
    LX = leftX;
  }
}
