//Game by ©Ken Chen 2019
//kenchendesigns.com
//Customers illustration, Michael Myers, https://drawsgood.com/persona-4-pixel-characters
//Player illustration, blackzen@huaban, https://huaban.com/pins/466720986/
//Grocery illustration, lovelylatte@Spoonflower, https://www.spoonflower.com/en/products/1218545-super-mini-pixel-foods-by-lovelylatte

int round=0;
int screen=0;
Player p;
Customer c;
Shelves s;
PImage player, b, ca, co, g, m, t, i;
PImage customers[]=new PImage[5];
String grocery[]={"corns", "tomatoes", "grapes", "bananas", "carrots", "milk"};
String g1, g2, g3;
int timer=30;
boolean instruction=true;

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  noStroke();
  newGame();
}

void draw() {
  switch(screen) {
  case 0: 
    startScreen(); 
    break;
  case 1: 
    gameScreen();
    break;
  case 2:
    endScreen();
    break;
  }
}

void mousePressed() {
  if (screen==0&&mouseX>=90&&mouseX<=431&&mouseY>=806&&mouseY<=914) {
    round=0;
    c=new Customer();
    screen=1;
  }
  if (screen==2&&mouseX>=156&&mouseX<=844&&mouseY>=508&&mouseY<=617) {
    timer=20;
    screen=0;
    round=0;
    c=new Customer();
  }
}

void newGame() {
  p=new Player();
  c=new Customer();
  s=new Shelves();
  g1=grocery[int(random(6))];
  g2=grocery[int(random(6))];
  g3=grocery[int(random(6))];
  while (g1==g2||g2==g3||g3==g1) {
    g1=grocery[int(random(6))];
    g2=grocery[int(random(6))];
    g3=grocery[int(random(6))];
  }
  round++;
}

void startScreen() {
  if (mouseX>=90&&mouseX<=431&&mouseY>=806&&mouseY<=914) image(loadImage("startscreen-hover.png"), 500, 500);
  else image(loadImage("startscreen.png"), 500, 500);
}

void gameScreen() {
  background(#6C4923);
  p.display();
  p.create();
  p.move();
  p.collect();
  c.dialog();
  c.create();
  s.create();
  if (screen==1&&p.win()) endScreen();
  if (screen==1&&p.lose()) screen=2;
  if (instruction) image(loadImage("move.png"), 500, 700);
}

void endScreen() {
  if (p.win()) {
    if (mouseX>=156&&mouseX<=844&&mouseY>=508&&mouseY<=617) image(loadImage("win-hover.png"), 500, 500);
    else image(loadImage("win.png"), 500, 500);
    timer=1;
    if (mousePressed&&mouseX>=156&&mouseX<=844&&mouseY>=508&&mouseY<=617) newGame();
  }
  if (p.lose()) {
    if (mouseX>=156&&mouseX<=844&&mouseY>=508&&mouseY<=617) image(loadImage("lose-hover.png"), 500, 500);
    else image(loadImage("lose.png"), 500, 500);
  }
}
