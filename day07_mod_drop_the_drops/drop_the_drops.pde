PVector position;
PVector vel;

//float yPos;
float size;//size of circle

float theta;
float r=0;

void setup() {
  size(600, 600);
  background(0);

  //yPos =0;
  //vel = 5;
  size = random(10, 50);
  position=new PVector(0, 0);
  vel=new PVector(5, 10);
}


void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  moveDrop();

  size=random(10);

  for (int i=1; i<50; i++) {
    makeDrop(i*20, 10);
    position.y=position.y+3;
  }
}

void moveDrop() {
  //position.x = vel.x;
  position.y =-r*sin(theta)* vel.y+height/2;
  println(sin(theta), theta);
  r+=1;
  theta +=0.1;

  if (position.y<0||position.y>height) {
    r=0;
    theta =0;
    println("here");
  }
}

void makeDrop(float xPos, float size) {
  int r=(int)xPos;
  int g=(int)position.y;

  if (r>255) {
    r=100;
  }
  if (g>255) {
    g=100;
  }
  noStroke();
  fill(r, g, 227);
  ellipse(xPos, position.y, size, size);
}

//float calculateSize(float x1, float y1) {
//  float s=x1+y1;
//  return s;
//}