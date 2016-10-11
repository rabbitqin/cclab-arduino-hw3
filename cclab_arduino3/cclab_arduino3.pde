import processing.serial.*;
int a=0;
int b=0;
int c=0;

PImage img, img2;  
Serial myPort;

int n = 5000;      // number of stars
float s = 7.0;     // maximum velocity

int count = 0;
Star[] stars = new Star[n];


void setup() {
  size(500, 500);
  background(255);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
  println("Choose a, b,or c?");
}

void draw() {
  if (a==1) {
    background(0);
    for (int i = 0; i < stars.length; i++)
      stars[i].display();

    if (mousePressed) {
      background(random(256), random(256), random(256));
      for (int i = 0; i < stars.length; i++) { 
        stars[i].update();
        stars[i].edges();
        stars[i].display();
      }
      myPort.write("A");
    }
  } else if (b==1) {
    myPort.write("CL");
    //println(int(red(get(mouseX, mouseY)))); 
    //println(int(green(get(mouseX, mouseY)))); 
    //println(int(blue(get(mouseX, mouseY))));

    myPort.write(int(red(get(mouseX, mouseY)))); 
    myPort.write(int(green(get(mouseX, mouseY)))); 
    myPort.write(int(blue(get(mouseX, mouseY))));
  } else if (c==1) {
    float d = map(mouseY, 0, height, 0, 100);

    int brightness = int(d);
    println(binary(brightness));
    //myPort.write("B");
    myPort.write(brightness);
  }
}

void keyPressed() {
  if (key =='a') {
    a = 1;
    b=0;
    c=0;
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
  } else if (key == 'b') {
    b=1;
    a=0;
    c=0;
    background(255);
    img = loadImage("1.png");
    image(img, 0, 0);
    img.loadPixels();
  } else if (key == 'c') {
    c=1;
    a=0;
    b=0;
    background(255);
    img2 = loadImage("5.png");
    image(img2, 0, 0);
    //img2.loadPixels();
  }
}