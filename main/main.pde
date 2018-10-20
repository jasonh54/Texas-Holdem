Deck d = new Deck();
Hand player = new Hand();
Hand cpu = new Hand();
Hand table = new Hand();

void setup(){
  for(int i=0; i<2; i++){
    player.addCard(d.popCard());
    cpu.addCard(d.popCard());
  }
  
}

void draw(){
  
}
