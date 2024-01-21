class View1 {
  ArrayList<PImage> imgs;
  
  View1() {
    imgs = new ArrayList<PImage>();
    PImage img = loadImage("player_1.png");
    img.resize(50, 50);
    imgs.add(img);
    img = loadImage("ghost1_stage1.png");
    img.resize(50, 50);
    imgs.add(img);
    img = loadImage("ghost1_stage2.png");
    img.resize(50, 50);
    imgs.add(img);
    img = loadImage("ghost2_stage2.png");
    img.resize(50, 50);
    imgs.add(img);
  }
  
  void display() {
    background(0);
    float y = 200;
    float x = 350;
    for (int i=0;i<imgs.size(); i++) {
      image(imgs.get(i), x+i*100, y);
    }
    
    textAlign(CENTER, CENTER);
    textSize(40);
    text("Press C to start game", width/2, 400);
    if (keyPressed && key == 'c') {
      page = 2;
    }
  }
}
