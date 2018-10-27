class Card{
  private int number;
  private int suit; //0-D, 1-C, 2-H, 3-S
  private String name;
  
  public Card(){
    
  }
  
  public Card(int n,int s, String na){
    number = n;
    suit = s;
    name = na;
    
  }
  

  //make draw function

  //getters
  public int getNum() {
    return number;
  }
  public int getSuit() {
    return suit;
  }
  public String getName() {
    return name;
  }

  
}
