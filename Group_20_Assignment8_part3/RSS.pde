class RSS{
  color c;
  PFont font;
  PFont italics;
  PFont bold;
  int y = 100;
  int currentPage = 1;
  int pages;
  int lParam = 0;
  int hParam = 9;
  int count = hParam - lParam + 1;
  StringDict articles;
  StringDict links;
  HashMap<Integer,String> titleLoc = new HashMap<Integer,String>();
  int[] nums = new int[count];
  boolean first = true;

  // Load RSS feed   
  XML rss; 

  RSS(XML _rss, color _c){
    this.rss = _rss;  
    this.c = _c;
    articles = new StringDict();
    links = new StringDict();
  }
  
  //goes to webpage when title is clicked on
  void click(){
    for(int x = 0; x < nums.length; x++){
      nums[x] = 100+40*x;
    }
    
    for(int z = 0; z < nums.length; z++){
      if(mouseY <= nums[z] + 10 && mouseY >= nums[z] - 20){
        link(links.get(titleLoc.get(nums[z])));
      }
    }
    if(((mouseX >= 680) && (mouseX <= 780)) && ((mouseY >= 5) && (mouseY <= 55))){
      if(currentPage > 1){
        currentPage--;
      }
    }
    if(((mouseX >= 790) && (mouseX <= 890)) && ((mouseY >= 5) && (mouseY <= 55))){
      if(currentPage < 3){
        currentPage++;
      }
    }
  }
  
  //void get
  
  void display(){
    //create fonts
    font = createFont("CourierNew.ttf", 15);
    italics = createFont("CourierNewItalic.ttf", 15);
    bold = createFont("CourierNewBold.ttf", 15);
    
    //get header info
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
    
    //get all of the children
    XML[] titleList = channel.getChildren("item/title");
    XML[] descriptionList = channel.getChildren("item/description");
    XML[] linkList = channel.getChildren("item/link");
    
    //generate page count
    pages = titleList.length/10;
    if(titleList.length % 10 != 0){
      pages++;
    }
    
    
    //display currentPage/pages
    fill(150);
    noStroke();
    rect(700, 58, 175, 25);
    stroke(1);
    String pageText = "Current Page: " + currentPage + "/" + pages;
    fill(0);
    textFont(font);
    text(pageText,705,70);
    
    //cover up duplicate titles
    fill(150);
    noStroke();
    rect(70, 80, 830, 390);
    stroke(1);
    
    //generate the neccessary dict's to tie everything together
    for( int i = 0; i >= lParam && i <= hParam; i++){
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
      if(i == hParam){
        y = 100; 
      }
    }
    
    //generate all possible y locations
    for(int x = 0; x < nums.length; x++){
      nums[x] = 100+40*x;
      println(nums[x]);
    }
    
    //rect for text preview
    fill(210);
    rect(0, 475, 899, 124);
    
    //display description if mouse is hovering
    for(int z = 0; z < nums.length; z++){
      if(mouseY <= nums[z] + 10 && mouseY >= nums[z] - 20){
        fill(0);
        textFont(italics);
        text(articles.get(titleLoc.get(nums[z])), 10, 500);
      }
    }
  }
}