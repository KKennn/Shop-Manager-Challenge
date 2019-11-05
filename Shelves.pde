class Shelves {
  Shelves() {
    b=loadImage("banana.png");
    ca=loadImage("carrot.png");
    co=loadImage("corn.png");
    g=loadImage("grape.png");
    m=loadImage("milk.png");
    t=loadImage("tomato.png");
  }
  void create() {
    fill(#391E01);
    rect(0, 250, 50, 300);
    placeItems(co, 25, 250, "vertical");
    rect(0, 650, 50, 300);
    placeItems(t, 25, 650, "vertical");
    rect(150, 950, 300, 50);
    placeItems(g, 150, 975, "horizontal");
    rect(550, 950, 300, 50);
    placeItems(b, 550, 975, "horizontal");
    rect(950, 250, 50, 300);
    placeItems(ca, 975, 250, "vertical");
    rect(950, 650, 50, 300);
    placeItems(m, 975, 650, "vertical");
  }
  void placeItems(PImage img, int x, int y, String direction) {
    if (direction=="vertical") for (int i=50;i<=250;i+=50) image(img,x,y+i);
    if (direction=="horizontal") for (int i=50;i<=250;i+=50) image(img,x+i,y);
  }
}
