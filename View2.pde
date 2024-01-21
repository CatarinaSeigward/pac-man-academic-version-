class View2 {
  PImage map;
  Student student;
  Teacher[] ghosts;
  Object[] objects;
  int[] colors;
  int gotObject = 0;
  boolean pass = false;
  boolean game_over = false;
  
  View2() {
    map = loadImage("map3.png");
    map.resize(width, height);
    map.loadPixels();
    colors = map.pixels;
    reset();
  }
  
  void reset() {
    String player = "player_" + Integer.toString(LEVEL) + ".png";
    PImage img = loadImage(player);
    img.resize(50,50);
    student = new Student(new PVector(50, 100), 15, img, map);
    ghosts = new Teacher[4];
    String ghost = "ghost1_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(ghost);
    img.resize(50,50);
    float speed = LEVEL * 0.5;
    ghosts[0] = new Teacher(new PVector(449, 199), speed, img, map);
    ghost = "ghost2_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(ghost);
    img.resize(50,50);
    ghosts[1] = new Teacher(new PVector(765, 470), speed, img, map);
    ghost = "ghost3_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(ghost);
    img.resize(50,50);
    ghosts[2] = new Teacher(new PVector(758, 793), speed, img, map);
    ghost = "ghost4_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(ghost);
    img.resize(50,50);
    ghosts[3] = new Teacher(new PVector(236, 789), speed, img, map);
    
    objects = new Object[4];
    String object = "object_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(object);
    img.resize(50,50);
    objects[0] = new Object(new PVector(43, 595), img);
    object = "object2_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(object);
    img.resize(50,50);
    objects[1] = new Object(new PVector(291, 960), img);
    object = "object3_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(object);
    img.resize(50,50);
    objects[2] = new Object(new PVector(840, 863), img);
    object = "object4_stage" + Integer.toString(LEVEL) + ".png";
    img = loadImage(object);
    img.resize(50,50);
    objects[3] = new Object(new PVector(920, 160), img);
    
    gotObject = 0;
    pass = false;
    game_over = false;
  }
  
  PVector generatePos(int x1, int x2, int y1, int y2) {
    while(true) {
      float x = random(x1, x2);
      float y = random(y1, y2);
      if (colors[int(y*map.width + x-5)] == PATH_COLOR  
            && colors[int(y*map.width + x+5)] == PATH_COLOR
            && colors[int((y-5)*map.width + x)]== PATH_COLOR
            && colors[int((y+5)*map.width + x)]== PATH_COLOR) {
        //println(red(colors[int(y*map.width + x-5)]), green(colors[int(y*map.width + x-5)]), blue(colors[int(y*map.width + x-5)]));
        //println(red(colors[int(y*map.width + x)]), green(colors[int(y*map.width + x)]), blue(colors[int(y*map.width + x)]));

        return new PVector(x, y);
      }
    }
  }
  
  void display() {
    imageMode(CORNER);
    image(map, 0, 0);
    student.display();
    if (game_over) {
      textAlign(CENTER, CENTER);
      textSize(60);
      fill(255, 255, 0);
      text("Game Over\n press C to continue", width/2, height/2);
      if (keyPressed && key=='c') {
        reset();
      }
      return;
    }
    
    if (pass) {
      textAlign(CENTER, CENTER);
      textSize(60);
      fill(255, 255, 0);
      text("PASS\n press C to continue", width/2, height/2);
      if (keyPressed && key=='c') {
        LEVEL ++;
        if (LEVEL == 4) {
          page = 3;
        } else {
          reset();
        }
      }
      return;
    }
    //显示ghost
    for (int i=0; i<4; i++) {
      ghosts[i].display(student);
    }
    
    // 显示object
    for (int i=0; i<4; i++) {
      if (objects[i].isShow) {
        objects[i].display();
      }
    }
    
    // 判断是不是获得了某个object
    for (int i=0; i<4; i++) {
      if (!objects[i].isShow) {
        continue;
      }
      if(student.in(objects[i].pos)) {
        objects[i].isShow = false;
        gotObject ++;
        if (gotObject == 4) {
          pass = true;
        }
      }
    }
    
    // 判断是否被ghost碰到
    for (int i=0; i<4; i++) {
      if (student.in(ghosts[i].pos)) {
        game_over = true;
        break;
      }
    }
  }
}


 
