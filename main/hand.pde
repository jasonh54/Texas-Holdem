import java.util.*;

class Hand {
  
  //constructor
  public Hand() {
    
  }
  
  public ArrayList<Card> cards = new ArrayList<Card>();
  public ArrayList<Card> mergedCards = new ArrayList<Card>();
  private boolean quad = false;
  private int triples = 0;
  private int doubles = 0;
  
  public void addCard(Card c) {
    cards.add(c);
  }
  
  //sort the hand via BubbleSort
  public void sortHand() {
    for (int i = 0; i < cards.size()-1; i++) {
      for (int k = 0; k < cards.size() - 1 - i; k++) {
        Card temp1 = cards.get(k);
        Card temp2 = cards.get(k + 1);
        
        if(temp1.getNum() > temp2.getNum()) {
          cards.set(k, temp2);
          cards.set(k + 1, temp1);
        }
      }
    }
  }
  
  //merges the table's hand and the player's hand
  public void mergeHand(Hand t) {
    t.sortHand();
    this.sortHand();
    
    int hIndex = 0;
    int tIndex = 0;
    
    while (hIndex != this.cards.size() && tIndex != t.cards.size()) {
      if (this.cards.get(hIndex).getNum() < t.cards.get(tIndex).getNum()) {
        this.mergedCards.add(this.cards.get(hIndex));
        hIndex++;
      }
      if (t.cards.get(tIndex).getNum() <= this.cards.get(hIndex).getNum()) {
        this.mergedCards.add(t.cards.get(tIndex));
        tIndex++;
      }
    }
    
    while (hIndex != this.cards.size())  {
      this.mergedCards.add(this.cards.get(hIndex));
      hIndex++;
    }
    while (tIndex != t.cards.size())  {
      this.mergedCards.add(t.cards.get(tIndex));
      tIndex++;
    }
  }
  
  public void checkQuads() {
    for (int i = 0; i < 4; i++) {
      if (mergedCards.get(i).getNum() == mergedCards.get(i + 1).getNum() 
      && mergedCards.get(i).getNum() == mergedCards.get(i + 2).getNum()
      && mergedCards.get(i).getNum() == mergedCards.get(i + 3).getNum()) {
        quad = true;
      } else {
        quad = false;
      }
    }
  }
  
  
  
}
