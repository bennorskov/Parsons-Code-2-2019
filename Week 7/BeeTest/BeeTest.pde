// Bee Simulator
/* 
States: 
  A: At Hive {
    40% Stay { 60% Pollen goes away }
    60% Start Flying
  }
  B: At Flower {
    60% stay {
      20% chance of having pollen
    }
    40% Fly
  }
  C: Flying w/out pollen {
    80% keep flying {
      20% go straight
      30% turn left
      30% turn right
    }
    20% move towards hive
  } 
  D: Flying w pollen {
    80% move towards hive
    20% keep flying {
      10% go straight
      5% turn left
      5% turn right
    }
  }
*/

Bee gertrude;
void setup(){
  println(degrees(0.13962634));
  size(800, 600);
  gertrude = new Bee(300, 300, 0, 0);
  gertrude.STATE = 1;
}
void draw() {
  background(200);
  gertrude.display();
  gertrude.update();
}
