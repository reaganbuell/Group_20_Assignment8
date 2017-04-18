class Bars{
  float tall;
  int x,y,wide;
  int i = 0;
  color c;

  Bars(int x,int y,float tall, color c){
    this.x = x;
    this.y = y;
    this.tall = tall;
    wide = 50;
    this.i = 0;
    this.c = c;
  }
  
  void display(){ 
    fill(c);
    noStroke();
    rect(x,y,wide,-i);
    if(abs(i) < tall){
      i+=1;
    }
  }
}