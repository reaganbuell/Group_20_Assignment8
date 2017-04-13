
XML bbcxml, cnetxml, yahooxml, nytimesxml, vergexml;
RSS bbc, cnet, yahoo, nytimes, verge;

void setup(){
  bbcxml = loadXML("bbc.xml");
  cnetxml = loadXML("CNET.xml");
  yahooxml = loadXML("yahoo.xml");
  nytimesxml = loadXML("nytimes.xml");
  vergexml = loadXML("verge.xml");
  
  bbc = new RSS(bbcxml);
  cnet = new RSS(cnetxml);
  yahoo = new RSS(yahooxml);
  nytimes = new RSS(nytimesxml);
  verge = new RSS(vergexml);
  
}

void draw(){
  
  
  //display RSS Feeds
  bbc.display();
  cnet.display();
  yahoo.display();
  nytimes.display();
  verge.display();
  
}