class Fireworks {
  boolean isFiring = false;
  float x, y, startY, fireLength, fireSpeed;
  int num_particles = 30;
  PVector[] particles = new PVector[num_particles];
  PVector[] particleVelocity = new PVector[num_particles];;
  
  int fireTime, fireStartTime; 
  color drawColor;
  Fireworks(float _x, float _y) {
    x = _x;
    y = _y;
    startY = _y;
    fireLength = 150;
    fireSpeed = -2;
    drawColor = color(255, 200, 0);

    fireTime = 2000;
  }
  void update() {
    if (isFiring) {
      if (abs(y - startY) < fireLength) {
        y += fireSpeed;
      } else {
        for (int i =0; i<num_particles; i++ ) {
          particles[i].add(particleVelocity[i]);
        }
      }
    }
  }
  void display() {
    noStroke();
    fill(drawColor);
    if (isFiring) {
      if (abs(y - startY) < fireLength) {
        ellipse(x, y, 4, 4);
      } else {
        for (int i =0; i<num_particles; i++ ) {
          ellipse(particles[i].x + x, particles[i].y + y, 4, 4);
        }
        if (millis() > fireStartTime + fireTime) {
          isFiring = false;
        }
      }
    }
  }
  void fire() {
    if (!isFiring) {
      isFiring = true;
      fireStartTime = millis();
      y = startY;

      for (int i =0; i<num_particles; i++ ) {
        particles[i] = new PVector(0,0);
        particleVelocity[i] = PVector.random2D().mult(random(2,4));
      }
    }
  }
}
