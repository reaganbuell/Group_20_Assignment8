
XML nyWorldXML, nyUSXML, nyBusXML, nyTechXML, nySportsXML;
RSS nyWorld, nyUS, nyBus, nyTech, nySports;

void setup(){
  size(800,600);
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

  
  nyWorld = new RSS(nyWorldXML);
  nyUS = new RSS(nyUSXML);
  nyBus = new RSS(nyBusXML);
  nyTech = new RSS(nyTechXML);
  nySports = new RSS(nySportsXML);
  
}

void draw(){
  
  
  
  //display RSS Feeds
  nyWorld.display();
  //nyUS.display();
  //nyBus.display();
  //nyTech.display();
  //nySports.display();
  
}