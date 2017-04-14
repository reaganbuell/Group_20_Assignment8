class RSS{
  color c;
  PFont font;
  PFont italics;
  PFont bold;
  boolean mReleased;
  int y = 100;
  StringDict articles;
  StringDict links;
  HashMap<Integer,String> titleLoc = new HashMap<Integer,String>();
  int[] nums = new int[10];
  boolean first = true;

  // Load RSS feed   
  XML rss; 

  RSS(XML _rss, color _c){
    this.rss = _rss;  
    this.c = _c;
    articles = new StringDict();
    links = new StringDict();
  }
  
  void click(){
    for(int x = 0; x < nums.length; x++){
      nums[x] = 100+40*x;
    }
    
    for(int z = 0; z < nums.length; z++){
      if(mouseY <= nums[z] + 10 && mouseY >= nums[z] - 20){
        link(links.get(titleLoc.get(nums[z])));
      }
    }
  }
  
  void display(){
    font = createFont("CourierNew.ttf", 15);
    italics = createFont("CourierNewItalic.ttf", 15);
    bold = createFont("CourierNewBold.ttf", 15);

    XML channel = rss.getChild("channel");
    XML sourceXML = channel.getChild("title");
    XML buildDateXML = channel.getChild("lastBuildDate");
    String source = (sourceXML.getContent()+ " RSS Feed");
    String buildDate = ("Updated on: "+ buildDateXML.getContent());
    
    //Source and last build date
    if(first){
      textFont(bold);
      fill(0);
      background(150);
      text(source, 10, 20);
      text(buildDate, 10, 40);
      first = false;
    }

        
    //draw previous and next scroll buttons
    fill(200);
    rect(580, 5, 100, 50, 7);
    rect(690, 5, 100, 50, 7);
    fill(0);
    textFont(bold);
    text("<<",620, 35);
    text(">>", 730, 35);
    
    //get all of the children
    XML[] titleList = channel.getChildren("item/title");
    XML[] descriptionList = channel.getChildren("item/description");
    XML[] linkList = channel.getChildren("item/link");
    
    for( int i = 0; i < titleList.length; i++){
      String title = titleList[i].getContent();
      String description = descriptionList[i].getContent();
      String link = linkList[i].getContent();
      articles.set(title, description);
      links.set(title, link);
      titleLoc.put(y, title);
      
      fill(c);
      textFont(font);
      text(title, 75, y);
      
      y += 40;
    }
    
    for(int x = 0; x < nums.length; x++){
      nums[x] = 100+40*x;
    }
    
    //rect for text preview
    fill(210);
    rect(0, 475, 899, 124);
    
    for(int z = 0; z < nums.length; z++){
      if(mouseY <= nums[z] + 10 && mouseY >= nums[z] - 20){
        fill(0);
        textFont(italics);
        text(articles.get(titleLoc.get(nums[z])), 10, 500);
      }
    }
    
    
  }
  
}