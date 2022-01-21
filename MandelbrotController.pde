
class MandelbrotController {
  
  int viewportWidth = width-300,viewportHeight = height;
  
  double Xpos = 0, Ypos = 0;
  double zoom = 0.25;
  
  int max_iterations = 20;
  
  void updateUniforms(PShader s) {
    s.set("max_iterations",mc.max_iterations);
    s.set("viewportWidth",mc.viewportWidth);
    s.set("viewportHeight",mc.viewportHeight);
    s.set("Xpos",(float)mc.Xpos);
    s.set("Ypos",(float)mc.Ypos);
    s.set("zoom",(float)mc.zoom);
  }

}
