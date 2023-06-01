public class Obstacle{
  public float b;
  public float t;
  public float LX;
  public boolean support = false;
  public float w;
  public double fS;
  public boolean tip = false;
  public int fallCount = 0;
  public double threshold = 5;
  public double slow = 5;
  public Obstacle(float bottom, float top, float leftX, float wide){
    b = bottom;
    t = top;
    w = wide;
    LX = leftX;
  }
}
