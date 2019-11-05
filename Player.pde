class Player {
  float xPos, yPos;
  boolean corns, tomatoes, grapes, bananas, milk, carrots;
  boolean coever, tever, gever, bever, mever, caever;
  String sentence;
  int itemNum;
  Player() {
    sentence="Now you have nothing";
    player=loadImage("player.png");
    xPos=width/2;
    yPos=width/2;
  }
  void create() {
    image(player, xPos, yPos);
  }
  void move() {
    if (keyPressed) {
      if (keyCode==UP&&yPos>280) yPos-=5+round*1.5;
      if (keyCode==DOWN&&yPos<910) yPos+=5+round*1.5;
      if (keyCode==LEFT&&xPos>80) xPos-=5+round*1.5;
      if (keyCode==RIGHT&&xPos<920) xPos+=5+round*1.5;
    }
  }
  void collect() {
    if (xPos>=70&&xPos<=110&&yPos>=250&&yPos<=550) corns=true;
    if (xPos>=70&&xPos<=110&&yPos>=650&&yPos<=950) tomatoes=true;
    if (yPos>=880&&yPos<=920&&xPos>=150&&xPos<=450) grapes=true;
    if (yPos>=880&&yPos<=920&&xPos>=550&&xPos<=850) bananas=true;
    if (xPos>=890&&xPos<=930&&yPos>=250&&yPos<=550) carrots=true;
    if (xPos>=890&&xPos<=930&&yPos>=650&&yPos<=950) milk=true;
  }
  void display() {
    if(checkItem(corns, coever, "corns")) coever=true;
    if(checkItem(carrots, caever, "carrots")) caever=true;
    if(checkItem(grapes, gever, "grapes")) gever=true;
    if(checkItem(tomatoes, tever, "tomatoes")) tever=true;
    if(checkItem(milk, mever, "milk")) mever=true;
    if(checkItem(bananas, bever, "bananas")) bever=true;
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text(sentence+".", 500, 600);
  }
  boolean checkItem(boolean thisItem, boolean thisItemEver, String thisItemName) {
    if (thisItem==true&&thisItemEver==false) {
      itemNum++;
      if (sentence.indexOf("nothing")>0) sentence=sentence.substring(0, sentence.indexOf("nothing"));
      if (itemNum==1) sentence+=thisItemName;
      if (itemNum>1) sentence+=", "+thisItemName;
      thisItemEver=true;
    }
    return thisItemEver;
  }
  boolean win() {
    return sentence.indexOf(g1)>0&&sentence.indexOf(g2)>0&&sentence.indexOf(g3)>0;
  }
  boolean lose() {
    return timer<=0;
  }
}
