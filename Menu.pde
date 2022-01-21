class Menu {
  
  int menu_width = 300;
  
  PImage minusbtnimg;
  PImage plusbtnimg;
  
  MandelbrotController controller;
  
  public Menu(MandelbrotController controller) {
    this.controller = controller;
    minusbtnimg = loadImage("minusbtn.png");
    minusbtnimg.resize(32,32);
    plusbtnimg = loadImage("plusbtn.png");
    plusbtnimg.resize(32,32);
  }
  
  public void render() {
    fill(30);
    rectMode(CORNER);
    rect(0,0,menu_width,height);
    textSize(32);
    fill(255);
    textAlign(CENTER);
    text("Mandelbrot",0,0,menu_width,50);
    textAlign(LEFT);
    textSize(20);
    text("Zoom: "+((int)(controller.zoom*100)/(float)100),5,70);
    text("Max Iterations:",5,120);
    textAlign(CENTER);
    textSize(32);
    text(controller.max_iterations,220,125);
    rectMode(CENTER);
    image(minusbtnimg,155,100);
    image(plusbtnimg,260,100);
    textAlign(LEFT);
    textSize(20);
    text("Xpos: "+(controller.Xpos),5,150);
    text("Ypos: "+(controller.Ypos),5,175);
    
    rectMode(CORNERS);
    //rect(155,100,155+32,100+32);
    
  }
  
  public void click(int x, int y) {
    if(between(155,x,155+32) && between(100,y,100+32)) {
      controller.max_iterations -= 5;

    }
    if(between(260,x,260+32) && between(100,y,100+32)) {
      controller.max_iterations += 5;
    }
  }
  
  public boolean between(int min, int x, int max) {
    return (x >= min) && (x <= max);
  }
  
}
