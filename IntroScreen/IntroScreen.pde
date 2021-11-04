import processing.video.*;

Movie intro;//백그라운드 동영상
PGraphics topimg1;
PGraphics topimg2;
PGraphics topimg3;
PGraphics topimg4;
int choice1 = 0;//player1 팽이 선택
int choice2 = 3;//player2 팽이 선택
PFont logo;
PImage manual;//설명서
PImage credit;
boolean ifcredit = false;
boolean ifmanual = false;

void setup() {
  size(1400, 900);
  intro = new Movie(this, "intro.mp4");
  intro.loop();
  logo = createFont("HY얕은샘물M", 20);

  topimg1 = createGraphics(200, 200);
  topimg2 = createGraphics(200, 200);
  topimg3 = createGraphics(200, 200);
  topimg4 = createGraphics(200, 200);
  
  manual = loadImage("manual.jpg");
  credit = loadImage("credit.jpg");
}

void draw() {
  loadPixels();
  intro.loadPixels();

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r = red(intro.pixels [loc]);
      float g = green(intro.pixels [loc]);
      float b = blue(intro.pixels [loc]);

      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();

  imageMode(CENTER);
  image(topimg1, width/5, height/10*8.5);
  image(topimg2, width/5*2, height/10*8.5);
  image(topimg3, width/5*3, height/10*8.5);
  image(topimg4, width/5*4, height/10*8.5);

  setTopGraphics00(topimg1);
  setTopGraphics01(topimg2);
  setTopGraphics02(topimg3);
  setTopGraphics03(topimg4);

  font();

  if (ifmanual) {
    imageMode(CENTER);
    image(manual, width/2, height/2);
  }
  
  if(ifcredit) {
    imageMode(CENTER);
    image(credit, width/2, height/2);
  }
}

void font() {
  textFont(logo, 200);
  fill(255, 50, 0);
  text("TOPS BATTLE", width/2-400, height/2+50);
  textFont(logo, 25);
  fill(255);
  text("h key : help", width*8.5/10, height*1/13);
  text("c key : credit", width*8.5/10, height*1.5/13);

  if (frameCount %40 <= 20) {
    textFont(logo, 40);
    fill(255);
    text("Press SpaceBar to play", width/2-180, height/2+150);
  } else {
  }
}

void movieEvent(Movie movie) {
  movie.read();
}


void keyPressed() {
  if (keyCode == RIGHT) {
    if (choice2 <3) {
      choice2++;
    }
  } else if (keyCode == LEFT) {
    if (choice2 >0) {
      choice2--;
    }
  } else if (key == 'd') {
    if (choice1 <3) {
      choice1++;
    }
  } else if (key == 'a') {
    if (choice1 >0) {
      choice1--;
    }
  } else if (key == 'h') {
    if (!ifmanual) {
      ifmanual = true;
      ifcredit = false;
    } else {
      ifmanual = false;
    }
  } else if (key == 'c'){
    if(!ifcredit) {
      ifcredit = true;
      ifmanual = false;
    } else {
      ifcredit = false;
    }
  } else if (key == ' ') {
    //game start
    //player1 팽이 choice1 setTopGraphics0+(choice1)
    //player2 팽이 choice2 setTopGraphics0+(choice2)
  }
}

void setTopGraphics00 (PGraphics pg) {

  pg.beginDraw();

  pg.ellipseMode(CENTER);
  pg.rectMode(CENTER);
  pg.translate(pg.width/2, pg.height/2);

  //팽이 뒤의 원, 선택되는 그래픽
  float s = pg.width/25;

  pg.strokeWeight(3);
  pg.fill(255);
  pg.ellipse(0, 0, 190, 190);

  if (choice1 == 0 || choice2 == 0) {
    pg.noFill();
    s = pg.width/25+0.5;
    if (choice1 == 0) {
      pg. stroke(255, 50, 0);
      pg.ellipse(0, 0, 190, 190);
    }
    if (choice2 == 0) {
      pg. stroke(50, 250, 0);
      pg.ellipse(0, 0, 190, 190);
    }
  }
  //

  //팽이 그래픽
  pg.strokeWeight(1);
  pg.fill(0, 0, 150);
  pg.stroke(0, 0, 150);
  pg.triangle(0, -7*s, -6*s, -3*s, -8.5*s, -5*s);
  pg.triangle(-6*s, -3*s, -10*s, 5*s, -6*s, 3*s);
  pg.triangle(-6*s, 3*s, 0, 7*s, -2*s, 10*s);
  pg.triangle(0, 7*s, 6*s, 3*s, 8.5*s, 6*s);
  pg.triangle(6*s, 3*s, 6*s, -3*s, 10*s, -5*s);
  pg.triangle(0, -7*s, 2*s, -10*s, 6*s, -3*s);

  pg.fill(230, 230, 0);
  pg.stroke(230, 230, 0);
  pg.ellipse(0, 0, 14*s, 14*s);

  pg.fill(255);
  pg.stroke(255);
  pg.ellipse(0, 0, 13*s, 13*s);

  pg.fill(0, 0, 100);
  pg.stroke(0, 0, 100);
  pg.triangle(0, -7*s, -6*s, -3*s, 6*s, -3*s);
  pg.triangle(0, 7*s, -6*s, 3*s, 6*s, 3*s);
  pg.rect(0, 0, 12*s, 6*s);

  pg.fill(100);
  pg.stroke(100);
  pg.ellipse(0, 0, 9*s, 9*s);

  pg.strokeWeight(1);
  pg.fill(0, 200, 100);
  pg.stroke(0, 200, 100);
  pg.triangle(0, -4*s, s, -5*s, -s, -5*s);
  pg.triangle(0, 4*s, s, 5*s, -s, 5*s);
  pg.triangle(4*s, 0, 5*s, s, 5*s, -s);
  pg.triangle(-4*s, 0, -5*s, s, -5*s, -s);

  pg.fill(0);
  pg.stroke(0);
  pg.quad(0, -4*s, 4*s, 0, 0, 4*s, -4*s, 0);

  pg.fill(255);
  pg.stroke(255);
  pg.quad(-3*s, 0, -4*s, 0, -2*s, -4*s, -2*s, -2*s);
  pg.quad(-3*s, 0, -4*s, 0, -2*s, 4*s, -2*s, 2*s);
  pg.quad(3*s, 0, 4*s, 0, 2*s, -4*s, 2*s, -2*s);
  pg.quad(3*s, 0, 4*s, 0, 2*s, 4*s, 2*s, 2*s);
  pg.quad(0, -3*s, 0, -4*s, -4*s, -2*s, -2*s, -2*s);
  pg.quad(0, -3*s, 0, -4*s, 4*s, -2*s, 2*s, -2*s);
  pg.quad(0, 3*s, 0, 4*s, -4*s, 2*s, -2*s, 2*s);
  pg.quad(0, 3*s, 0, 4*s, 4*s, 2*s, 2*s, 2*s);

  pg.fill(250, 100, 0);
  pg.stroke(250, 100, 0);
  pg.ellipse(0, 0, 3*s, 3*s);
  pg.fill(250, 50, 0);
  pg.stroke(250, 50, 0);
  pg.ellipse(0, 0, 1.5*s, 1.5*s);

  pg.stroke(0);
  pg.strokeWeight(3);
  pg.line(0, -0.3*s, 0, 0.7*s);
  pg.line(-0.4*s, -0.3*s, 0.4*s, -0.3*s);


  //edit end//
  pg.endDraw();
}

void setTopGraphics01 (PGraphics pg) {
  pg.beginDraw();

  pg.ellipseMode(CENTER);
  pg.rectMode(CENTER);

  pg.translate(pg.width/2, pg.height/2);

  //팽이 뒤의 원, 팽이 선택하는 그래픽
  float s = pg.width/22;
  pg.strokeWeight(3);
  pg.fill(255);
  pg.ellipse(0, 0, 190, 190);

  if (choice1 == 1 || choice2 == 1) {
    pg.noFill();
    s = pg.width/22+0.5;
    if (choice1 == 1) {
      pg. stroke(255, 50, 0);
      pg.ellipse(0, 0, 190, 190);
    }
    if (choice2 == 1) {
      pg. stroke(50, 250, 0);
      pg.ellipse(0, 0, 190, 190);
    }
  }
  //

  pg.strokeWeight(1);

  //팽이 그래픽
  pg.fill(250, 80, 0);
  pg.stroke(250, 80, 0);
  pg.rect(0, 0, 10*s, 10*s);

  pg.fill(70);
  pg.stroke(70);
  pg.triangle(-4*s, -4*s, -7*s, -4*s, -4*s, -7*s);
  pg.triangle(4*s, 4*s, 7*s, 4*s, 4*s, 7*s);
  pg.triangle(4*s, -4*s, 7*s, -4*s, 4*s, -7*s);
  pg.triangle(-4*s, 4*s, -7*s, 4*s, -4*s, 7*s);

  pg.fill(255, 50, 50);
  pg.stroke(255, 50, 50);
  pg.quad(-5*s, 0, -7*s, -3*s, -3*s, -7*s, 0, -5*s);
  pg.quad(5*s, 0, 7*s, -3*s, 3*s, -7*s, 0, -5*s);
  pg.quad(-5*s, 0, -7*s, 3*s, -3*s, 7*s, 0, 5*s);
  pg.quad(5*s, 0, 7*s, 3*s, 3*s, 7*s, 0, 5*s);
  pg.quad(-5*s, 0, 0, -5*s, 5*s, 0, 0, 5*s);


  pg.fill(100);
  pg.stroke(100);
  pg.triangle(-2*s, -2*s, 2*s, -2*s, 0, -9*s);
  pg.triangle(-2*s, 2*s, 2*s, 2*s, 0, 9*s);
  pg.triangle(-2*s, -2*s, -2*s, 2*s, -9*s, 0);
  pg.triangle(2*s, -2*s, 2*s, 2*s, 9*s, 0);

  pg.fill(255);
  pg.stroke(255);
  pg.ellipse(0, 0, 10*s, 10*s);

  pg.fill(255, 50, 10);
  pg.stroke(255, 50, 10);
  pg.rect(0, 0, 6*s, 6*s);

  pg.fill(255, 100, 0);
  pg.stroke(255, 100, 0);
  pg.triangle(-3*s, -3*s, -7*s, 0, -3*s, 3*s);
  pg.triangle(3*s, -3*s, 7*s, 0, 3*s, 3*s);
  pg.triangle(-3*s, -3*s, 0, -7*s, 3*s, -3*s);
  pg.triangle(-3*s, 3*s, 0, 7*s, 3*s, 3*s);

  pg.stroke(255);
  pg.strokeWeight(2);
  pg.line(0, -7*s, 0, 7*s);
  pg.line(7*s, 0, -7*s, 0);

  pg.fill(0, 200, 100);
  pg.stroke(0, 200, 100);
  pg.strokeWeight(1);
  pg.quad(0, -3*s, -3*s, 0, 0, 3*s, 3*s, 0);

  pg.strokeWeight(2);
  pg.noFill();
  pg.stroke(255);
  pg.triangle(0, -s, -3*s, 0, 0, s);
  pg.triangle(0, -s, 3*s, 0, 0, s);
  pg.triangle(-s, 0, s, 0, 0, 3*s);
  pg.triangle(-s, 0, s, 0, 0, -3*s);

  pg.fill(255);
  pg.stroke(255);
  pg.quad(0, s, -s, 0, 0, -s, s, 0);

  pg.stroke(0);
  pg.strokeWeight(3);
  pg.line(0, -0.3*s, 0, 0.7*s);
  pg.line(-0.4*s, -0.3*s, 0.4*s, -0.3*s);

  //edit end//
  pg.endDraw();
}

void setTopGraphics02 (PGraphics pg) {
  float t = pg.width/5.2;
  pg.beginDraw();
  pg.pushMatrix();
  pg.translate(pg.width/2, pg.height/2);

  //팽이 뒤의 원, 팽이 선택하는 그래픽
  pg.strokeWeight(3);
  pg.fill(255);
  pg.ellipse(0, 0, 190, 190);

  if (choice1 == 2 || choice2 == 2) {
    pg.noFill();
    t = t+5;
    if (choice1 == 2) {
      pg. stroke(255, 50, 0);
      pg.ellipse(0, 0, 190, 190);
    }
    if (choice2 == 2) {
      pg. stroke(50, 250, 0);
      pg.ellipse(0, 0, 190, 190);
    }
  }
  //

  //팽이 그래픽
  pg.strokeWeight(1);
  pg.stroke(0);

  drawPartOfTop1(pg, t);
  pg.rotate(PI/3);
  drawPartOfTop1(pg, t);
  pg.rotate(PI/3);
  drawPartOfTop1(pg, t);
  pg.rotate(PI/3);
  drawPartOfTop1(pg, t);
  pg.rotate(PI/3);
  drawPartOfTop1(pg, t);
  pg.rotate(PI/3);
  drawPartOfTop1(pg, t);
  pg.fill(0, 80, 0);
  pg.ellipse(0, 0, 2.8*t, 2.8*t);
  pg.fill(255);
  pg.ellipse(0, 0, t/3, t/3);



  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  drawPartOfTop2(pg, t);
  pg.rotate(PI/5);
  pg.popMatrix();
  pg.endDraw();
}

void setTopGraphics03(PGraphics pg) {
  float t = pg.width/2;
  pg.beginDraw();
  pg.pushMatrix();
  pg.translate(pg.width/2, pg.width/2);

  //팽이 뒤의 원, 팽이 선택하는 그래픽
  pg.strokeWeight(3);
  pg.fill(255);
  pg.ellipse(0, 0, 190, 190);

  if (choice1 == 3 || choice2 == 3) {
    pg.noFill();
    t = t+7;
    if (choice1 == 3) {
      pg. stroke(255, 50, 0);
      pg.ellipse(0, 0, 190, 190);
    }
    if (choice2 == 3) {
      pg. stroke(50, 250, 0);
      pg.ellipse(0, 0, 190, 190);
    }
  }

  //팽이 그래픽
  pg.strokeWeight(1);
  pg.stroke(0);

  pg.fill(255, 120, 0);
  pg.ellipse(0, 0, t, t);
  pg.noFill();
  pg.strokeWeight(3);
  pg.ellipse(0, 0, t/6, t/6);
  pg.ellipse(0, 0, t/3, t/3);
  pg.ellipse(0, 0, t/2, t/2);
  pg.ellipse(0, 0, t/1.5, t/1.5);
  pg.ellipse(0, 0, t/1.2, t/1.2);
  pg.ellipse(0, 0, t, t);

  drawPartOfTop(pg, t);
  pg.rotate(-PI/1.50);
  drawPartOfTop(pg, t);
  pg.rotate(-PI/1.45);
  drawPartOfTop(pg, t);
  pg.fill(0);
  pg.strokeWeight(2);
  pg.ellipse(0, 0, t/10, t/10);
  pg.popMatrix();
  pg.endDraw();
}


private static void drawPartOfTop(PGraphics pg, float t) {
  pg.fill(255, 0, 0);
  pg.beginShape();
  pg.strokeWeight(2);
  pg.vertex(-t/8, -t/3);
  pg.vertex(0, - 2*t/3);
  pg.vertex(-t/2, -t/2);
  pg.vertex(-t/1.5, -t/3);
  pg.vertex(-t/1.5, -t/4);
  pg.vertex(-t/1.2, -t/6);
  pg.vertex(-t/1.25, -t/8);
  pg.vertex(-t/1.2, 0);
  pg.vertex(-t/1.6, t/10);
  pg.endShape(CLOSE);
  pg.beginShape(TRIANGLE);
  pg.vertex(t/10, -2/t);
  pg.vertex(t/11, -2/t);
  pg.vertex(t/4, -t/3);
  pg.vertex(t/3, -t/5);
  pg.endShape();
  pg.fill(0, 155, 0);
  pg.beginShape(TRIANGLES);
  pg.vertex(-t/1.2, -t/6);
  pg.vertex(-t/1.3, -t/8);
  pg.vertex(-t/1.2, 0);
  pg.endShape();
  pg.beginShape(TRIANGLES);
  pg.vertex(0, - 2*t/3);
  pg.vertex(-t/2, -t/2);
  pg.vertex(-t/1.5, -t/3);
  pg.endShape();
  pg.fill(190, 150, 150);
  pg.ellipse(-t/1.7, -t/4, t/15, t/15);
  pg.strokeWeight(4);
  pg.line(-t/1.5, 0, -t/8, -t/2);
  pg.fill(255);
  pg.beginShape(TRIANGLES);
  pg.vertex(t/8, - 2*t/3);
  pg.vertex(t/16, -t/16);
  pg.vertex(t/18, -t/16);
}

private static void drawPartOfTop1(PGraphics pg, float t) {

  pg.strokeWeight(4);

  pg.fill(100, 200, 100);

  pg.beginShape(QUAD);
  pg.vertex(-t/2.0, -2*t);
  pg.vertex(t/2.0, -1.8*t);
  pg.vertex(t/2.5, -t*1.3);
  pg.vertex(-t/3, -t*1.3);
  pg.endShape();
  //
  pg.fill(0);
  pg.beginShape();
  pg.vertex(0, -1.8*t);
  pg.vertex(-t/5, -1.5*t);
  pg.vertex(t/5, -1.5*t);
  pg.endShape(CLOSE);
  pg.strokeWeight(8);
  //
}

private static void drawPartOfTop2(PGraphics pg, float t) {
  pg.fill(255);
  pg.strokeWeight(6);
  pg.fill(40, 200, 50);
  pg.beginShape();
  pg.curveVertex(0.4*t, 0.4*t);
  pg.curveVertex(0.3*t, 0.3*t);
  pg.curveVertex(t, 0.8*t);
  pg.curveVertex(t, 2*t);
  pg.endShape(CLOSE);
}
