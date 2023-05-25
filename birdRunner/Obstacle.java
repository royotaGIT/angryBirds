public class Obstacle{
  public float b;
  public float t;
  public float LX;
  public boolean fall = false;
  public float w;
  public double fS;
  public boolean tip = false;
  public int fallCount = 0;
  public Obstacle(float bottom, float top, float leftX, float wide){
    b = bottom;
    t = top;
    w = wide;
    LX = leftX;
  }
}
