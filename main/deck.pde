import java.util.ArrayList;
import java.util.Random;
class Deck{
  private ArrayList<Card> cards = new ArrayList<Card>();
  private Card cardnum;
  
  public Deck(){
    createDeck();
    shuffle();
  }
  
  public void createDeck(){
    String[] suits = new String[]{" diamond"," clubs"," hearts"," spades"};
    String name = "";
    for(int i=2;i<11;i++){
      for(int k=0;k<4;k++){
        name = i + suits[k];
        cards.add(new Card(i,k,name));
      }
    }
    for(int i=0;i<4;i++){
       name = "J" + suits[i]; 
       cards.add(new Card(11,i,name));
    }
    for(int i=0;i<4;i++){
      name = "Q" + suits[i];
      cards.add(new Card(12,i,name));
    }
    
    for(int i=0;i<4;i++){
       name = "K" + suits[i];
       cards.add(new Card(13,i,name));
    }
    for(int i=0;i<4;i++){
       name = "A" + suits[i];
       cards.add(new Card(14,i,name));
    }
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
  
  public Card popCard(){
    cardnum = cards.get(0);
    cards.remove(0);
    return cardnum;
  }
  

}
