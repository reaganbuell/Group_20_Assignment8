class Button{
  PFont bold;
  
  Button(){
    
    
  }
  
  void prev(){
    
  }
  
  void next(){
    
  }
  
  void display(){
    //font init
    bold = createFont("CourierNewBold.ttf", 15);
    
    //draw rect and arrows
    fill(200);
    rect(680, 5, 100, 50, 7);
    rect(790, 5, 100, 50, 7);
    fill(0);
    textFont(bold);
    text("<<",720, 35);
    text(">>", 830, 35);
    
  }
  
  
}