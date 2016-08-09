int num = 300;
Sinwave mySin[] = new Sinwave[num];
void setup()
{
  noStroke();
  size(1000, 500);
  for (int i = 0; i < num; i++)
  {
    mySin[i] = new Sinwave(random(width), random(height), random(100, 300));
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < num; i++)
  {
    mySin[i].display();
    mySin[i].displayReflect();
    //mySin[i].displayleft();
    //mySin[i].displayRight();
  }
}

class Sinwave
{
  float xpos, ypos, jump;
  Sinwave(float temp_xpos, float temp_ypos, float temp_jump)
  {
    xpos = temp_xpos;
    ypos = temp_ypos;
    jump = temp_jump;
  }

  void display()
  {
    fill(50,200,random(height));
    ellipse(xpos, -abs(sin(ypos)*jump)+height-10, 10, 10);
    ypos = ypos + random(0.01, 0.02);
  }
    void displayReflect()
  {
    fill(200,random(255),200);
    ellipse(xpos, abs(sin(1-ypos)*jump)-10, 10, 10);
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