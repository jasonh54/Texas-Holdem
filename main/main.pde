Deck d = new Deck();
Hand player = new Hand();
Hand cpu = new Hand();
Hand table = new Hand();

Graphics gfx = new Graphics();

void setup(){
  
  size(800,800);
  
  for(int i = 0;i<3;i++){
    player.addCard(d.popCard());
    cpu.addCard(d.popCard());
  }
  
}

void draw(){
}
