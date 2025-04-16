import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float r, g, b;
float amplitude;

void setup() {
  size(640, 480);

  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);

  if (amplitude > 2.5) {
    background(255);
    fill(r, g, b);
    rect(random(width), random(height), 50, 50);
  } else {
    background(0);
    rectMode(CENTER);
    fill(random(25));
    rect(width/2, height/2, 20, 20);
  }
}

void oscEvent(OscMessage myMessage) {
  if (myMessage.checkAddrPattern("/amplitude")) {
    amplitude = myMessage.get(0).floatValue();
    //println(amplitude);
  }
}
