ArrayList<PVector> pos;
ArrayList<Cs> cs;

void setup() {
  size(640, 290);
  pos = new ArrayList<PVector>();
  cs = new ArrayList<Cs>();
}

void draw() {
  background(0);
  generate();

  for (int i = pos.size()-1; i>=0; i--) {    
    cs.get(i).editvalue(pos.get(i).x, pos.get(i).y);
    if (cs.get(i).Dead()) {  
      cs.remove(i);
      pos.remove(i);
    }
  }

  fill(255);
  text(nfc(frameRate, 1), 20, 20);
}


void generate() {
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);
  println(d);
  if (d > 11) {
    cs.add( new Cs());
    pos.add(new PVector(mouseX, mouseY));
  }
}


class Cs {
  float r;
  float alpha = 255;
  float zs = 0;
  float bs =  0;

  Cs() {
    r = random(1, 170);
  }

  void editvalue(float x, float y) {
    bs = pow(2, -zs);
    noFill();
    stroke(255, alpha*bs);
    strokeWeight(2);
    ellipse(x, y, r*(1-bs), r*(1-bs) );
    zs+=0.06;
  }

  boolean Dead() {
    if (alpha*bs <=1) {
      return true;
    } else {
      return false;
    }
  }
}
