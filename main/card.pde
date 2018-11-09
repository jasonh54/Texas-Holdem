class Card{
  //contains the number of the card
  private int number;
  //contains the suit of the card, 0-D, 1-C, 2-H, 3-S
  private int suit;
  //contains the name of the card
  private String name;
  //contains the x position from where to draw the card from
  private int cardX;
  //the variable for if the card is flipped or not, allows the game to hide the graphical value of the cards, so the player can not see them (the values of the card are still there, just the card itself in the game is not)
  public boolean flipped = true;
  
  public Card(){
    
  }
  
  public Card(int n,int s, String na, int cX){
    number = n;
    suit = s;
    name = na;
    cardX = cX;
    
  }
  

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
  public int getCardX(){
    return cardX;
  }
  
  //"flips card", sets the flipped variable of the card to false, i.e. flipping it up
  public void flipCard(){
    if(flipped){
      
      flipped = false;   
      
    } 
  }
  
  public void drawCard(int posX, int posY){
    
    if(flipped){
      if(suit == 0 || suit == 2){
        image( imgCBR.get(0,0,73,99), posX, posY);
      }
      
      if(suit == 1 || suit == 3){
        image( imgCBB.get(0,0,73,99), posX, posY);
      } 
      
    } else {
      
       if(suit == 0){
         image( imgD.get(cardX,0,73,99), posX, posY); 
       } else if(suit == 1){
         image( imgC.get(cardX,0,73,99), posX, posY); 
       } else if(suit == 2){
         image( imgH.get(cardX,0,73,99), posX, posY);  
       } else if(suit == 3){
         image( imgS.get(cardX,0,73,99), posX, posY);  
       }
       
    }
    
  } 
  
}
