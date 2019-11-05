class Customer {
  int time=32-round*5+millis()/1000;
  Customer() {
    for (int i=0; i<5; i++) customers[i]=loadImage("customer "+(i+1)+".png");
  }
  void create() {
    image(customers[round%5], 100, 100);
    timer=(time-millis()/1000);
  }
  void dialog() {
    fill(#E5AA6B);
    rect(-1, -1, width, 200);
    fill(0);
    textSize(24);
    textAlign(LEFT);
    text("Can I have some "+g1+", "+g2+", and "+g3+" in "+timer+" seconds?", 200, 50);
  }
}
