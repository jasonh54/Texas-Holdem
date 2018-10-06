import java.util.*;

class Hand {
  
  //constructor
  public Hand() {
    
  }
  
  private ArrayList<Card> cards = new ArrayList<Card>();
  
  public void addCard(Card c) {
    cards.add(c);
  }
  
  //sort the hand via BubbleSort
  public void sortHand() {
    for (int i = 0; i < 3; i++) {
      for (int k = 0; k < 2 - i; k++) {
        Card temp1 = player.get(k);
        Card temp2 = player.get(k + 1);
        
        if(temp1.getNum() > temp2.getNum()) {
          cards.set(k, temp2);
          cards.set(k + 1, temp1);
        }
      }
    }
  }
  
  
}
