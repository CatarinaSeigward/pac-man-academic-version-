class Student extends Object{
  Student(PVector pos_, float v_, PImage img_, PImage map_) {
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
  
  void setVelocity(float v) {
    velocity = v;
  }
  
  boolean in(PVector p) {
    if (p.x>pos.x-img.width/2 && p.x<pos.x+img.width/2&&p.y>pos.y-img.height/2 && p.y<pos.y+img.height/2) {
      return true;
    }
    return false;
  }
}

class Object {
  PVector pos;
  float velocity;
  PImage img;
  int[] colors;
  boolean isShow = true;
  
  Object(PVector pos_, PImage img_) {
    pos = pos_.copy();
    img = img_;
  }
  
  void left() {
    int x = int(pos.x - velocity);
    if (x < 0) {
      return ;
    }
    color c = colors[int(pos.y * width + x)];
    if (c != PATH_COLOR) {
      return;
    }
    pos.x -= velocity;
  }
  
  void right() {
    int x = int(pos.x + velocity);
    if (x > width) {
      return ;
    }
    color c = colors[int(pos.y * width + x)];
    if (c != PATH_COLOR) {
      return;
    }
    pos.x += velocity;
  }
  
  void up() {
    int y = int(pos.y - velocity);
    if (y < 0) {
      return ;
    }
    color c = colors[int(y * width + pos.x)];
    if (c != PATH_COLOR) {
      return;
    }
    pos.y -= velocity;
  }
  
  void down() {
    int y = int(pos.y + velocity);
    if (y > height) {
      return ;
    }
    color c = colors[int(y * width + pos.x)];
    if (c != PATH_COLOR) {
      return;
    }
    pos.y += velocity;
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(img, 0, 0);
    fill(255, 0, 0);
    circle(0, 0, 10);
    popMatrix();
  }
}
