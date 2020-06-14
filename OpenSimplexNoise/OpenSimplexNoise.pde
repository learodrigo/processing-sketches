/**
 * Noise3D. 
 * 
 * Using 3D noise to create simple animated texture. 
 * Here, the third dimension ('z') is treated as time. 
 */
 
float increment = 0.1;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.01; 

OpenSimplexNoise noise;

void setup() {
  size(1200, 800);
  frameRate(30);
  noise = new OpenSimplexNoise();
}

void draw() {
  
  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment; 
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      yoff += increment;
      
      // Calculate noise and scale by 255
      // float bright = (float) noise.eval(xoff,yoff,zoff)*255;
      // float n = (float) noise.eval(xoff,yoff,zoff)*255;
      float n = (float) noise.eval(xoff,yoff,zoff);
      float bright = map(n, -1, 1, 0, 255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright, bright, bright);
    }
  }
  updatePixels();
  
  zoff += zincrement;  
}
