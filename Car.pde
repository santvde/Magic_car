class Car {
  float [] pos;
  float speed;
  float angle;
  float degrees;
  float radius = 15;


  Car(float X, float Y) {
    pos = new float [2];
    pos[0] = X;
    pos[1] = Y;
    speed = 0;
    angle = 0;
  }

  Car(PVector v) {
    pos = new float [2];
    pos[0] = v.x;
    pos[1] = v.y;
    speed = 0;
    angle = 0;
  } 



  float commands() {
    if (keyPressed) {
      if (key == 'd') {
        angle += 5;
        return angle;
      }
      if (key == 'a') {
        angle -= 5;
        return angle;
      }
      if (key == 'w') {
        speed += 0.4;
        speed = constrain(speed,0,8);
        return speed;
      }
      if (key == 's') {
        speed -= 0.1;
        speed = constrain(speed,0,8);
        return speed;
      }
    }
    return speed;
  }

  void Move() {
    degrees = angle * 0.017;

    pos[0] = pos[0] + speed * cos(degrees);
    pos[1] = pos[1] + speed * sin(degrees);
  }



  void Draw() {
    stroke(0,255,0);
    line(pos[0], pos[1], pos[0] + 10*speed * cos(degrees), pos[1] + 10*speed * sin(degrees));
    noStroke();
    fill(255, 0, 0);
    ellipse(pos[0], pos[1], 2*radius, 2*radius);
  }

  float distSq(float x1, float y1, float x2, float y2) {
    float distance = (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2);
    return distance;
  }


  boolean is_alive(Track track) {
    for (PVector v : track.points) {
      if ( dist(pos[0], pos[1], v.x, v.y) - track.size < - radius) {
        return true;
      }
    }
    return false;
  }
}
