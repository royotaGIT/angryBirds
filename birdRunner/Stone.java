public class Stone extends Obstacle{
  public Stone(float bottom, float top, float leftX, float wide){
    super(bottom, top, leftX, wide);
    this.threshold = 11;
    this.slow = 10;
  }
}
