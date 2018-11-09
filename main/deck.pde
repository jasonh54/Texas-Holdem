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
    int tempcount = 0;
    for(int i = 2;i < 11;i++){
      tempcount += 73;
      for(int k=0;k<4;k++){
        name = i + suits[k];
        cards.add(new Card(i,k,name,tempcount));
      }
    }
    for(int i=0;i<4;i++){
       name = "J" + suits[i]; 
       cards.add(new Card(11,i,name,730));
    }
    for(int i=0;i<4;i++){
      name = "Q" + suits[i];
      cards.add(new Card(12,i,name,803));
    }
    
    for(int i=0;i<4;i++){
       name = "K" + suits[i];
       cards.add(new Card(13,i,name,876));
    }
    for(int i=0;i<4;i++){
       name = "A" + suits[i];
       cards.add(new Card(14,i,name,0));
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
