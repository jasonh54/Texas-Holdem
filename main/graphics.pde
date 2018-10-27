class Graphics{
  
  PImage img;
  
  private String[] cardDiamonds = new String[]{"../cards/diamonds/diamonds2.png","../cards/diamonds/diamonds3.png","../cards/diamonds/diamonds4.png","../cards/diamonds/diamonds5.png","../cards/diamonds/diamonds6.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png","../cards/blankcard.png"};
  
  public void displayCards(Card c){
    
    displayDiamonds(c);
    
  }
  
  public void displayDiamonds(Card c){
    
    if(c.getSuit() == 0){
      
      img = loadImage(cardDiamonds[c.getNum()]);
      image(img, 50, 50);
      
    }
  }
  
  
}
