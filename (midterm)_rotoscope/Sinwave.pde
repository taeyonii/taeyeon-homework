
class Sinwave
{
  float xpos, ypos, jump;
  Sinwave(float temp_xpos, float temp_ypos, float temp_jump)
  {
    xpos = temp_xpos;
    ypos = temp_ypos;
    jump = temp_jump;
  }
float ran=random(15,50);
  void display()
  {
    fill(50,200,random(height),random(30,200));
    ellipse(xpos, -abs(sin(ypos)*jump*1.5)+height, ran, ran);
    ypos = ypos + random(0.01, 0.02);
  }
    void displayReflect()
  {
    fill(200,random(255),200,random(30,200));
    ellipse(xpos, abs(sin(1-ypos)*jump)*1.5, ran, ran);
    ypos = ypos + random(0.01, 0.02); 
  }
    void displayleft()
  {
    fill(20,200,random(height));
    ellipse(abs(tan(1-xpos)*jump)+width/2,ypos, random(10,15), random(10,15));
    xpos = xpos + random(0.01, 0.02); 
  }
  void displayRight()
  {
    fill(100,40,random(height));
    ellipse(-abs(tan(1-xpos)*jump)+width/2,ypos, random(10,15), random(10,15));
    xpos = xpos + random(0.01, 0.02); 
  }
}