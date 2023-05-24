public class Platform extends Obstacle{
  public float w;
  public boolean rlean = false;
  public boolean llean = false;
  public Platform(float bottom, float LX, float wide){
    super(bottom, bottom - 10, LX);
    w = wide;
  }
}
