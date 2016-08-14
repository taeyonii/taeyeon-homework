class Linkage {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity=9.0;
  float mass=2.0;
  float stiffness = 0.25;
  float damping = 0.7;
  
  Linkage(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(PImage puppet) {
    noStroke();
    image(puppet, x, y);
    stroke(255);
    //line(x, y, nx, ny);
  }
}