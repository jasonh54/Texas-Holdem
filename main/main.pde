Deck d = new Deck();
Hand player = new Hand();
Hand cpu = new Hand();
Hand table = new Hand();
Graphics gfx = new Graphics();

//PImage (processing image) variables for each image, with img and the abbreviation of the image, ex Diamonds = D, which equals imgD.
//imgD contains the image for the diamond cards
PImage imgD;
//imgC contains the image for the club cards
PImage imgC;
//imgS contains the image for the spade cards
PImage imgS;
//imgH contains the image for the heart cards
PImage imgH;
//imgCBB contains the image for the blueback card, or just the back of the card colored blue;imgCBB = img + cards back blue
PImage imgCBB;
//imgCBR contains the image for the redback card, or just the back of the card colored red;imgCBR = img + cards back red
PImage imgCBR;

void setup() {

  //loads the image into the PImage variables, so the PIamge variables actually have the images now
  imgD = loadImage(gfx.cdD);
  imgC = loadImage(gfx.cdC);
  imgS = loadImage(gfx.cdS);
  imgH = loadImage(gfx.cdH);
  imgCBB = loadImage(gfx.cbb);
  imgCBR = loadImage(gfx.cbr);

  //sets size of the canvas to a x of 800, and a y of 800
  size(800, 800);

  //gives the table 5 random cards from the deck
  for (int i = 0; i < 5; i++) {
    table.addCard(d.popCard());
  }

  /* gives the player and cpu each 2 random cards from the deck,
   and also flipping the player cards upwards so that the player can see their cards,
   but not the cpu's (right now cpu card are visible,
   simply remove the "cpu.cards.get(i).flipCard()" line or comment it out to hide the cpu cards.*/

  for (int i = 0; i < 2; i++) {
    player.addCard(d.popCard());
    player.cards.get(i).flipCard();
    cpu.addCard(d.popCard());
    cpu.cards.get(i).flipCard();
  }
  player.mergeHand(table);
  cpu.mergeHand(table);
  println("Player Stats:");
  player.checkCombos();
  println("CPU Stats:");
  cpu.checkCombos();
}

//player.checkCombos();
//cpu.checkCombos();

/* turn counter for game,
 basically variable determines which cards of the table are shown,
 if turn = 1, only the first card of the table is shown,
 if turn = 2, then only the first two cards of the table is shown,
 and so on. Should go from 0 to 3 to 4 and ending at 5.*/

int turn = 5;

/* increment is the variable for x of the cards of the tables to draw them properly,
 which increases by 73 every loop to move the card to the right*/

int increment = 200;

/* inc2 is another increment varibale seperate from the original increment variable "increment" (very simple i know),
 and it increases by 73 to draw the respective card in the right place (like the increment counter (original). cpuInc is the same thing.*/

int inc2 = 300;
int cpuInc = 651;

void draw() {
  //multiples of 73
  for (int i = 0; i < table.cards.size(); i++) {
    table.cards.get(i).drawCard(increment, 350);
    increment += 73;
    if (increment - (table.cards.size()) * 73 == 200) {
      increment = 200;
    }
  }
  for (int i = 0; i < 2; i++) {
    if (i == 0) {
      inc2 = 300;
      cpuInc = 651;
    }
    player.cards.get(i).drawCard(inc2, 700);
    cpu.cards.get(i).drawCard(cpuInc, 200);
    inc2 += 73;
    cpuInc += 73;
  }
  for (int i = 0; i < turn; i++) {
    table.cards.get(i).flipCard();
  }
}
