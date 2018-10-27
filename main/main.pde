Deck d = new Deck();
Hand player = new Hand();
Hand cpu = new Hand();
Hand table = new Hand();

Graphics gfx = new Graphics();

void setup(){
  
  size(800,800);
  
  for(int i = 0;i < 2; i++) {
    player.addCard(d.popCard());
    cpu.addCard(d.popCard());
  }
  
  for (int i = 0; i < 5; i++) {
    table.addCard(d.popCard());
  }
  
  player.checkCombos();
  cpu.checkCombos();
}

void draw(){
}
