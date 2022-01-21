#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform int max_iterations;
uniform int viewportWidth;
uniform int viewportHeight;
uniform float Xpos;
uniform float Ypos;
uniform float zoom;

float mandelbrot(double x0, double y0) {
	double x2 = 0;
	double y2 = 0;
	double x = 0;
	double y = 0;
	float iteration = 0;
	while(x2 + y2 <= 4 && (iteration < max_iterations)) {
		y = 2*x*y + y0;
		x = x2 - y2 + x0;
		x2 = x*x;
		y2 = y*y;
		iteration = iteration + 1;
	}
	return iteration;
}

vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() {
	double x = gl_FragCoord.x;
	double y = gl_FragCoord.y;
	double translatedX = ((x-(viewportWidth/2))/(viewportWidth*zoom)) + (Xpos/viewportWidth);
	double translatedY = ((y-(viewportHeight/2))/(viewportHeight*zoom)) + (Ypos/viewportHeight);
	float it = mandelbrot(translatedX,translatedY);
	if(it != max_iterations) {
		vec3 c = hsv2rgb(vec3(it/max_iterations,1.0,1.0));
		gl_FragColor = vec4(c.x,c.y,c.z,1.0);
	}else{
		gl_FragColor = vec4(0.0,0.0,0.0,1.0);
	}
}
