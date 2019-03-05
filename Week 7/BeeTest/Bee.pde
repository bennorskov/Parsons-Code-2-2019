class Bee {
  int FLY_WITH_POLLEN = 0;
  int FLY = 1;
  int AT_HIVE = 2;
  int AT_FLOWER = 3;
  int STATE = AT_HIVE;

  PVector pos, vel, hivePosition;
  float flySpeed = 3;
  float rotationAngle = 8;
  Bee(float _x, float _y, float _hivePosX, float _hivePosY) {
    pos = new PVector(_x, _y);
    vel = new PVector(flySpeed, 0);
    hivePosition = new PVector(_hivePosX, _hivePosY);
    println(radians(rotationAngle));
  }
  void display() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, 10, 7);
    fill(255, 255, 0);
    ellipse(pos.x + 4, pos.y, 3, 3);
    fill(255, 50);
    ellipse(pos.x, pos.y - 4, 5, 10);
  }
  void update() {
    switch(STATE) {
    case 0: //fly with pollen
      flywith();
      break;
    case 1: // fly
      fly();
      break;
    case 2: // at Hive
      beAtHive();
      break;
    case 3: // at flower
      atFlower();
      break;
    }
  }

  void fly() {
    /*80% keep flying {
      20% go straight
      30% turn left
      30% turn right
    }
    */
    float seed = random(100);
    if (seed < 20) {
      // 20% move towards hive (0-20)
      vel.rotate( atan2(hivePosition.y-pos.y, hivePosition.x-pos.x) );
    } else {
      // keep flying (seed is 20 - 100)
      if (seed > 80) {
        // turn right 20% (80 - 100)
        vel.rotate( radians(rotationAngle));
      } else if (seed > 60) {
        // turn left 20% (60 - 80)
        vel.rotate( -radians(rotationAngle));
      }
      // keep going straight (20-60) (40%)
    }
    pos.add(vel);
  }
  void flywith() {
  }
  void beAtHive() {
  }
  void atFlower() {
  }
}
