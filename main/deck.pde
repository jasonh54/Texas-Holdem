import java.util.ArrayList;
class Deck{
  private ArrayList<Card> cards = new ArrayList<Card>();
  
  public Deck(){
    
  }
  
  public void createDeck(){
    Card c = new Card();
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
    
  }
  
}
