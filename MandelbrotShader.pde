void setup() {
  size(848,480,P2D);
  mc = new MandelbrotController();
  m = new Menu(mc);
  mandelbrotShader = loadShader("mandelbrotshader.glsl");
  canvas = createGraphics(width-300,height,P2D);
  mc.updateUniforms(mandelbrotShader);
}

PShader mandelbrotShader;
PGraphics canvas;

Menu m;
MandelbrotController mc;

void draw() {
  background(0);
  //mc.render();
  m.render();
  canvas.beginDraw();
  canvas.rectMode(CORNERS);
  
  canvas.shader(mandelbrotShader);
  canvas.rect(0,0,canvas.width,canvas.height);
  canvas.endDraw();
  image(canvas,300,0);
}

void mouseClicked() {
  if(mouseX < 300) {
    m.click(mouseX,mouseY);
  }
  mc.updateUniforms(mandelbrotShader);
}

void keyPressed() {
  
  if(key == 'k') {
    mc.max_iterations += 100;
  }
  if(key == 'j') {
    mc.max_iterations -= 100;
  }
  mc.updateUniforms(mandelbrotShader);
}

void mouseDragged() {
  mc.Xpos -= (double)(mouseX-pmouseX)/mc.zoom;
  mc.Ypos += (double)(mouseY-pmouseY)/mc.zoom;
  mc.updateUniforms(mandelbrotShader);
}

void mouseWheel(MouseEvent evt) {
  int k = evt.getCount();
  if(k < 0) {
    mc.zoom += mc.zoom/10;
  }else{
    mc.zoom -= mc.zoom/10;
  }
  mc.updateUniforms(mandelbrotShader);
}
