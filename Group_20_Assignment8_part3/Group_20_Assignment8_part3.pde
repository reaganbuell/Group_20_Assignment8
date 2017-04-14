import java.util.Map;

XML nyWorldXML, nyUSXML, nyBusXML, nyTechXML, nySportsXML;
RSS nyWorld, nyUS, nyBus, nyTech, nySports;

Button prev, next;

void setup(){
  size(900,600);
  background(150);
  
  //load in RSS feeds
  nyWorldXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/World.xml");
  nyUSXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/US.xml");
  nyBusXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Business.xml");
  nyTechXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml");
  nySportsXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Sports.xml");
  
  //local files for debugging
  //nyWorldXML = loadXML("World.xml");
  //nyUSXML = loadXML("US.xml");
  //nyBusXML = loadXML("Business.xml");
  //nyTechXML = loadXML("Technology.xml");
  //nySportsXML = loadXML("Sports.xml");

  
  nyWorld = new RSS(nyWorldXML, color(255, 0, 0));
  nyUS = new RSS(nyUSXML, color(0, 0, 255));
  nyBus = new RSS(nyBusXML, color(0, 255, 0));
  nyTech = new RSS(nyTechXML, color(255, 255, 0));
  nySports = new RSS(nySportsXML, color(255, 0, 255));
  
  prev = new Button();
  next = new Button();
  
}

void draw(){
  //display buttons
  prev.display();
  next.display();
  
  //display RSS Feeds
  nyWorld.display();
  //nyUS.display();
  //nyBus.display();
  //nyTech.display();
  //nySports.display();
  
}

void mouseReleased(){
  nyWorld.click();
  //nyUS.click();
  //nyBus.click();
  //nyTech.click();
  //nySports.click();
  
}