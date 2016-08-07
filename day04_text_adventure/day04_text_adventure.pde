PFont f;

int state=0;
int bgValue=0;

int tempState=0;

String state0="Hi, do you want to play a game? \n Y/N";
String state1="It's get dark. \n Do you want to go to bed?\n a:It was really hard day. I will sleep. \n b:I have to do homework.";
String state2="Morning:\nYou become well again. Will you do the remainning work? \n a:I'll finish the homework from now. \n b: I'll concentrate on today's work.";
String state3="So tough day... Which one will you do at first? \n a:Web b:Design c:Code";
String state4="You become fit again but couldn't finished it on time.";
String state5="Now you have new lots of homework to do.";
String state6="Welcome to HTML/CSS/JS!";
String state7="Welcome to DESIGN!";
String state8="Welcome to Processing!";
String state10="--QUIT--";


void setup() {
  size(700, 500);
  f=createFont("SanSerif", 30, true);
  textFont(f, 20);
}

void draw() {
  textAlign(CENTER); 
  //textMode(CENTER);
  QandAB(state0, 0, 255);

  if (state==1)  QandAB(state1, 30, 255);
  else if (state==2)  QandAB(state2, 200, 50);
  else if (state==3)  QandAB(state3, 80, 255);
  else if (state==4)  {QandAB(state4, 50, 255); quit_or_not();}
  else if (state==5)  {QandAB(state5, 80, 255); quit_or_not();}
  else if (state==6)  {QandAB(state6, 130, 255); quit_or_not();}
  else if (state==7)  {QandAB(state7, 130, 255); quit_or_not();}
  else if (state==8)  {QandAB(state8, 130, 255); quit_or_not();}

  else if (state==10) QandAB(state10, 255, 0);
}

void QandAB(String words, int bgV, int fontColor) {
  background(bgV);
  fill(fontColor); 
  text(words, width/2, height/2);
  tempState=state;
}

void quit_or_not() {
  textAlign(RIGHT);
  text("Again: RETURN\nQuit: DEL", width-20, height-50);
  tempState=10;
}

void keyPressed() {
  println(state, key);
 
  if (key==ENTER) {
    state=0;
  }
  if (key==8) {
    state=10;
  }

  //START
  if (key=='y' || key=='Y') {
    state=+1;
  }
  //STAGE01
  if (state==1) {
    if (key=='a') {
      state=2;
    } else if (key=='b') {
      state=3;
    }
  }

  //STAGE02
  else if (state==2) {
    if (key=='a') {
      state=4;
    } else if (key=='b') {
      state=5;
    }
  } else if (state==3) {
    if (key=='a') {
      state=6;
    } else if (key=='b') {
      state=7;
    } else if (key=='c') {
      state=8;
    }
  }
}