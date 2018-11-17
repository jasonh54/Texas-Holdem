import java.util.*;

class Hand {
  
  //constructor
  public Hand() {
    
  }
  
  public ArrayList<Card> cards = new ArrayList<Card>();
  public ArrayList<Card> mergedCards = new ArrayList<Card>();
  public ArrayList<Card> sortedSuit = new ArrayList<Card>();
  private boolean quad = false;
  private int triples = 0;
  private int doubles = 0;
  private boolean straight = false;
  private boolean flush = false;
  private Card highestDouble = new Card(0,0,"empty",0);
  private Card highestTriple = new Card(0,0,"empty",0);;
  private Card highestQuad = new Card(0,0,"empty",0);;
  private Card highestStraight = new Card(0,0,"empty",0);;
  private Card highestFlush = new Card(0,0,"empty",0);;
  
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
  
  public void sortSuit() {
    sortedSuit = mergedCards;
    for (int i = 0; i < sortedSuit.size()-1; i++) {
      for (int k = 0; k < sortedSuit.size() - 1 - i; k++) {
        Card temp1 = sortedSuit.get(k);
        Card temp2 = sortedSuit.get(k + 1);
        
        if(temp1.getSuit() > temp2.getSuit()) {
          sortedSuit.set(k, temp2);
          sortedSuit.set(k + 1, temp1);
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
    
    while (hIndex < this.cards.size() && tIndex < t.cards.size()) {
       if(this.cards.get(hIndex).getNum() < t.cards.get(tIndex).getNum()){
         mergedCards.add(this.cards.get(hIndex));
         hIndex++;
         println(hIndex);
       }else if(this.cards.get(hIndex).getNum() >= t.cards.get(tIndex).getNum()){
         mergedCards.add(t.cards.get(tIndex));
         tIndex++;
         println(tIndex);
       }
    }
    
    
    while (hIndex < this.cards.size())  {
       mergedCards.add(this.cards.get(hIndex));
       hIndex++;
    }
    while (tIndex < t.cards.size())  {
       mergedCards.add(t.cards.get(tIndex));
       tIndex++;      
    }
  }
  
  //check whether there is a Quad
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
  
   //checks the number of Doubles in the hand
  public void checkDoubles() {
    for (int i = 0; i < 6; i++) {
      if (mergedCards.get(i).getNum() == mergedCards.get(i + 1).getNum()) {
        doubles++;
        highestDouble = mergedCards.get(i + 1);
        i++;
        
      }
    }
  }
  
  //checks the number of Triples in the hand
  public void checkTriples() {
    for (int i = 0; i < 5; i++) {
      if (mergedCards.get(i).getNum() == mergedCards.get(i + 1).getNum()) {
        if (mergedCards.get(i).getNum() == mergedCards.get(i + 2).getNum()) {
          triples++;
          highestTriple = mergedCards.get(i + 1);
          i+=2;
        }
      }
    }
  } 
  
  //checks for a straight in the hand
  public void checkStraight(){
    for(int i=0; i<3; i++){
      int prevNum = mergedCards.get(i).getNum();
      int count = 0;
      for(int k=1; k<5; k++){
        
        if(mergedCards.get(i+k).getNum()-1 == prevNum){
          prevNum = mergedCards.get(i+k).getNum();
          count++;
          highestStraight = mergedCards.get(i+k);
        }
      }
      if(count == 4){
        straight = true;
      }
    }
  }
  
  //checks for a flush in the hand
  public void checkFlush(){
    for(int i=0; i<3; i++){
      int count = 0;
      for(int k=1;k<5;k++){
        if(sortedSuit.get(i).getSuit() == sortedSuit.get(i+k).getSuit()){
          highestFlush = sortedSuit.get(i+k);
          count++;
        }
      }
      if(count == 4){
        flush = true;
      }
      
    }
  }
  
  //checks for all the combos
  public void checkCombos() {
    checkDoubles();
    checkTriples();
    checkQuads();
    checkStraight();
    sortSuit();
    checkFlush();
    printAll();
    
  }
  
  //print all data in the hand
  public void printAll(){
    println("Number of doubles: "+doubles);
    println("Highest Pair: "+highestDouble.getName());
    println("Number of triples: "+triples);
    println("Highest Triple: "+highestTriple.getName());
    println("Quad: "+quad);
    println("Highest Quad: "+highestQuad.getName());
    println("Straight: "+straight);
    println("Highest Straight: "+highestStraight.getName());
    println("Flush: "+flush);
    println("Highest Flush: "+highestFlush.getName());
    for(int i=0; i<sortedSuit.size();i++){
      println(sortedSuit.get(i).getName());
    }
  }
 
  /*the program might count the same card over 
  (eg. one quad, also counted as three doubles)
  so we might have to make one function, not three,
  that checks:
  if i = i+1, then if i = i+2, then if i = i+3
  and for each if/then, if it is false, it would count
  as a double OR a triple OR a quad */
/*  
  
  public void checkDTQ() {
    for (int i = 0; i < 6; i++) {
      //checks for a double
      if mergedCards.get(i).getNum() == mergedCards.get(i + 1).getNum() {
        //checks for a triple
        if mergedCards.get(i).getNum() == mergedCards.get(i + 2).getNum() {
        
        }
      } else {
        //nothing
      }
    }
  }
  
 */ 
  
}
