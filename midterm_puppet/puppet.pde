Linkage Head, Torso, Waist, Hip;
Linkage LegLeftTop, LegLeftBottom;
Linkage LegRightTop, LegRightBottom;

PImage controller;

PImage head;
PImage torso;
PImage arm_left_top;
PImage arm_left_bottom;
PImage arm_right_top;
PImage arm_right_bottom;
PImage waist;
PImage hip;
PImage leg_left_top;
PImage leg_left_bottom;
PImage leg_right_top;
PImage leg_right_bottom;

boolean start=false;

PImage curtain_back;
PImage curtain_left;
PImage curtain_right;

int curX;
int curY;

void setup() {
  size(1000, 800);
  imageMode(CENTER);

  Head=new Linkage(0.0, width/2);
  Torso=new Linkage(0.0, width/2);
  Waist=new Linkage(0.0, width/2);
  Hip=new Linkage(0.0, width/2);
  LegLeftTop=new Linkage(-20, width/2);
  LegLeftBottom=new Linkage(-20, width/2);
  LegRightTop=new Linkage(20, width/2);
  LegRightBottom=new Linkage(20, width/2);

  controller=loadImage("controller.png");
  head=loadImage("head.png");
  torso=loadImage("torso.png");
  arm_left_top=loadImage("arm_left_top.png");
  arm_left_bottom=loadImage("arm_left_bottom.png");
  arm_right_top=loadImage("arm_right_top.png");
  arm_right_bottom=loadImage("arm_right_bottom.png");
  waist=loadImage("waist.png");
  hip=loadImage("hip.png");
  leg_left_top=loadImage("leg_left_top.png");
  leg_left_bottom=loadImage("leg_left_bottom.png");
  leg_right_top=loadImage("leg_right_top.png");
  leg_right_bottom=loadImage("leg_right_bottom.png");

  curtain_back=loadImage("red_curtain_back.jpg");
  curtain_left=loadImage("red_curtain_left.png");
  curtain_right=loadImage("red_curtain_right.png");

  background(255);
}

void draw() {

  background(255);

  Head.update(mouseX, mouseY+100);
  Torso.update(Head.x, Head.y+50);
  Waist.update(Torso.x, Torso.y+25);
  Hip.update(Waist.x, Waist.y+25);
  LegLeftTop.update(Hip.x-20, Hip.y+25);
  LegLeftBottom.update(LegLeftTop.x+10, LegLeftTop.y+70);
  LegRightTop.update(Hip.x+30, Hip.y+20);
  LegRightBottom.update(LegRightTop.x+10, LegRightTop.y+65);


  if (start==false) {
    image(curtain_back, width/2, height/2, width, height);
    image(curtain_left, 100, height/2, 200, height);
    image(curtain_right, width-100, height/2, 200, height);
    textSize(30);
    fill(255);
    textAlign(CENTER);
    text("Welcome,\n press any key \n to start show!!", width/2, height/2);
  } else {
    image(controller, mouseX, mouseY);
    image(curtain_left, 100, height/2, 200, height); 
    image(curtain_right, width-100, height/2, 200, height);

    Waist.display(waist);
    Hip.display(hip);
    LegLeftTop.display(leg_left_top);
    LegLeftBottom.display(leg_left_bottom);
    LegRightTop.display(leg_right_top);
    LegRightBottom.display(leg_right_bottom);
    Torso.display(torso);
    Head.display(head);

    pushMatrix();
    arm(arm_left_top, Torso.x-40, Torso.y, -10, 20);
    arm(arm_left_bottom, 0, 50, -35, 40);
    popMatrix();
    pushMatrix();
    arm(arm_right_top, Torso.x+40, Torso.y-20, 25, 20);
    arm(arm_right_bottom, 0, 30, 60, 45);
    popMatrix();
  }
}

void arm(PImage img, float x, float y, float imgX, float imgY) {
  translate(x, y);
  rotate((mouseX/float(width) - 0.5) * -PI);
  image(img, imgX, imgY);
}


void keyPressed() {
  if (keyPressed) {
    println(key, start);
    if (start==false) {
      start=true;
      println(key, start);
    } else if (start==true&&key==8) {
      start=false; 
      println(key, start);
    }
  }
}