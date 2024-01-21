class Teacher extends Object{
  int dir; //0:left  1:up   2:right   3:down
  
  Teacher(PVector pos_, float v_, PImage img_, PImage map_) {
    super(pos_, img_);
    pos = pos_.copy();
    img = img_;
    velocity = v_;
    map_.loadPixels();
    colors = map_.pixels;
  }
  
  void setImage(PImage img_) {
    img = img_;
  }
  
  boolean cleft() {
    int x = int(pos.x - velocity);
    int y = int(pos.y);
    if (x < 0) {
      return false;
    }
    color c = colors[y * width + x];
    if (c != PATH_COLOR) {
      return false;
    }
    pos.x -= velocity;
    return true;
  }
  
  boolean cright() {
    int x = int(pos.x + velocity);
    int y = int(pos.y);
    if (x > width) {
      return false;
    }
    color c = colors[y * width + x];
    if (c != PATH_COLOR) {
      return false;
    }
    pos.x += velocity;
    return true;
  }
  
  boolean cup() {
    int y = int(pos.y - velocity);
    int x = int(pos.x);
    if (y < 0) {
      return false;
    }
    color c = colors[y * width + x];
    if (c != PATH_COLOR) {
      return false;
    }
    pos.y -= velocity;
    return true;
  }
  
  boolean cdown() {
    int x = int(pos.x);
    int y = int(pos.y + velocity);
    if (y > height) {
      return false;
    }
    color c = colors[y * width + x];
    if (c != PATH_COLOR) {
      return false;
    }
    pos.y += velocity;
    return true;
  }
  
  void update(Student stu) {
    PVector direction = PVector.sub(stu.pos, pos);
    boolean ismove = false;
    if (abs(direction.x) > abs(direction.y)) {  //horizon move
      if (direction.x > 0) {
        ismove = cright();
      } else {
        ismove = cleft();
      }
      if (!ismove) {
        if (direction.y > 0) {
          ismove = cdown();
        } else {
          ismove = cup();
        }
      }
    } else {  //vertical move
      if (direction.y > 0) {
        ismove = cdown();
      } else {
        ismove = cup();
      }
      if (!ismove) {
        if (direction.x > 0) {
          ismove = cright();
        } else {
          ismove = cleft();
        }
      }
    }
  }
  
  void display(Student stu) {
    update(stu);
    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(img, 0, 0);
    popMatrix();
  }
}
