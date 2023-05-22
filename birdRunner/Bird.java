public class Bird{
    public double velocity;
    public float xPos;
    public float yPos;
    public Bird(float x, float y){
        velocity = 0;
        xPos = x;
        yPos = y;
    }
    public void changeVelocity(double newV){velocity = newV;}
    public void move(){xPos-=velocity;}
}
