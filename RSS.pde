class RSS{
  PFont font;
  PFont italics;
  PFont bold;
  int y = 100;
  // Load RSS feed   
  XML xml; 

  RSS(XML _xml){
    this.xml = _xml;  
    
  }
  
  //detect where mouse is
  void detect(){
    if(mouseY <= y + 15 && mouseY >= y){
      
    }
    
  }
 
  void display(){
    font = createFont("CourierNew.ttf", 15);
    italics = createFont("CourierNewItalic.ttf", 15);
    bold = createFont("CourierNewBold.ttf", 15);
    textFont(font);
    fill(255,0,0);

    XML channel = xml.getChild("channel");
    XML sourceXML = channel.getChild("title");
    XML buildDateXML = channel.getChild("lastBuildDate");
    XML[] itemList = channel.getChildren("item");
    
    String source = (sourceXML.getContent()+ " RSS Feed");
    String buildDate = ("Updated on: "+ buildDateXML.getContent());
    
    text(source, 10, 20);
    text(buildDate, 10, 40);
    
    fill(200);
    rect(580, 5, 100, 50, 7);
    rect(690, 5, 100, 50, 7);
    
    
    for( int i = 0; i < itemList.length; i++){
      XML titleXML = itemList[i].getChild("title");
      XML descriptionXML = itemList[i].getChild("description");
      String title = titleXML.getContent();
      String description = descriptionXML.getContent();
      
      fill(0);
      text(title, 10, y);
      //rect for text preview
      fill(210);
      rect(0, 450, 800, 600);
      fill(0);
      text(description, 10, 475);
      
      y += 45;
    }
    
  }

}