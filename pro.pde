View1 view1;
View2 view2;
View3 view3;
color PATH_COLOR = color(29, 28, 48);
int LEVEL = 1;
int page = 1;
PImage img;
int[] colors;

void setup() {
  size(1000, 1000);
  view1 = new View1();
  view2 = new View2();
  view3 = new View3();
  img = loadImage("map3.png");
  img.resize(width, height);
  img.loadPixels();
  colors = img.pixels;
}

void draw() {
  if (page == 3) {
    view3.display();
  } else if (page == 2) {
    view2.display();
  } else {
    view1.display();
  }
}

void keyPressed() {
  //println(mouseX, mouseY);
  if (key == 'a') {
    view2.student.left();
  } else if (key == 'w') {
    view2.student.up();
  } else if (key == 's') {
    view2.student.down();
  } else if (key == 'd') {
    view2.student.right();
  }
}

void mousePressed() {
  println(mouseX, mouseY);
  println(red(colors[mouseY*width + mouseX]));
}
