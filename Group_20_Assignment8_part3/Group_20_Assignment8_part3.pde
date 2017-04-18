//Coded by Reagan Buell

import java.util.Map;
//library for radio button use MUST DOWNLOAD TO RUN
import controlP5.*;

ControlP5 controlP5;
RadioButton r;
XML nyWorldXML, nyUSXML, nyBusXML, nyTechXML, nySportsXML;
RSS nyWorld, nyUS, nyBus, nyTech, nySports;
Button prev, next;

void setup(){
  size(900,600);
  background(150);
  
  //setup Radio buttons
  controlP5 = new ControlP5(this);
  r = controlP5.addRadioButton("radio", 10, 135);
  r.setSpacingRow(50);
  r.setColorLabel(255);
  r.addItem("World", 1);
  r.addItem("US", 2);
  r.addItem("Business", 3);
  r.addItem("Technology", 4);
  r.addItem("Sports", 5);
  r.activate(0);
  
  //load in RSS feeds
  nyWorldXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/World.xml");
  nyUSXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/US.xml");
  nyBusXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Business.xml");
  nyTechXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml");
  nySportsXML = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/Sports.xml");
  
  //create previous and next buttons
  prev = new Button();
  next = new Button();
  
  //pass through the XML's and colors for displaying
  nyWorld = new RSS(nyWorldXML, color(255, 0, 0));
  nyUS = new RSS(nyUSXML, color(0, 0, 255));
  nyBus = new RSS(nyBusXML, color(0, 255, 0));
  nyTech = new RSS(nyTechXML, color(255, 255, 0));
  nySports = new RSS(nySportsXML, color(255, 0, 255));
  
}

void draw(){
  //display RSS Feeds and buttons
  if(r.getState("World")){
    nyWorld.display();
    prev.display();
    next.display();
  } else if(r.getState("US")){
      nyUS.display();
      prev.display();
      next.display();
  } else if(r.getState("Business")){
      nyBus.display();
      prev.display();
      next.display();
  } else if(r.getState("Technology")){
      nyTech.display();
      prev.display();
      next.display();
  } else if(r.getState("Sports")){
      nySports.display();
      prev.display();
      next.display();
  }
}

//detect if mouse released over an article title
void mouseReleased(){
  if(r.getState("World")){
    nyWorld.click();
  } else if(r.getState("US")){
      nyUS.click();
  } else if(r.getState("Business")){
      nyBus.click();
  } else if(r.getState("Technology")){
      nyTech.click();
  } else if(r.getState("Sports")){
      nySports.click();
  }
}