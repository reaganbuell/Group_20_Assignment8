import java.util.Map;
IntDict popular;
String[] lines;
float y,w,d,h;
Bars bY, bW, bD, bH;
int i = 0;


void setup(){
 size(800,550);
 background(0);
 //initialize dictionary
 popular = new IntDict();
 popular.set("yoplait", 0);
 popular.set("weight", 0);
 popular.set("dannon", 0);
 popular.set("hiland", 0);
 
 //load in CSV as strings
 lines = loadStrings("Yogurt.csv");
 for (int i = 0 ; i < lines.length; i++) {
   if (lines[i].equals("yoplait")){
     popular.increment("yoplait");
   }
   if (lines[i].equals("weight")){
     popular.increment("weight");
   }
   if (lines[i].equals("dannon")){
     popular.increment("dannon");
   }
   if (lines[i].equals("hiland")){
     popular.increment("hiland");
   }
  }
  y = float(popular.get("yoplait"))*(0.3814433);
  bY = new Bars(110,450,y,#FF5AA2);
  w = float(popular.get("weight"))*(0.3814433);
  bW = new Bars(300,450,w,#6F50FF);
  d = float(popular.get("dannon"))*(0.3814433);
  bD = new Bars(480,450,d,#FFD750);
  h = float(popular.get("hiland"))*(0.3814433);
  bH = new Bars(655,450,h,#52FFE6);
  
}

void draw(){
  //axes
  stroke(225);
  line(50,450,750,450);
  line(50,80,50,450);
  //x-axis
  textSize(25);
  fill(225);
  text("Brands",350,520);
  //y-axis
  pushMatrix();
  translate(100,100);
  rotate(-PI/2); 
  textSize(20);
  text("Popularity (number of purchases)", -320,-70); 
  popMatrix();
  
  //title
  fill(225);
  textSize(30);
  text("Popularity of Name Brand Yogurts", 170,40);
  
  //brand names
  textSize(20);
  fill(#FF5AA2);
  text("Yoplait", 100, 470);
  fill(#6F50FF);
  text("W.Watchers", 270, 470);
  fill(#FFD750);
  text("Dannon", 470, 470);
  fill(#52FFE6); 
  text("Hiland", 650, 470);
  
  //animate the bars
  bY.display();
  bW.display();
  bD.display();
  bH.display();
  
}