import java.util.ArrayList;
import java.util.Random;

class Deck{
  private ArrayList<Card> cards = new ArrayList<Card>();
  
  public Deck(){
    
  }
  
  public void createDeck(){
    
  }
  
  public void shuffle(){
    Random rand = new Random();
    for(int i=0; i<cards.size(); i++){
      int r = rand.nextInt(cards.size());
      Card temp = cards.get(i);
      cards.set(i, cards.get(r));
      cards.set(r, temp);
    }
  }
  
  
  
}
