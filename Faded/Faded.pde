int num = 10;
int range = 100;

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(1440, 855);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  frameRate(1000);
}

void draw() 
{
  background(51);
  delay(100);
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  
  // Draw a line connecting the points
     for(int k=1; k<num; k++) { 
    float offset = 50;
    float val1 = float(k)/num * 204.0 + 51;
    float val = float(k)/num * 204.0 + 51;

    //strokeWeight(.045*val +.045*val1 );
    float ellipseSize = 50;
    float ellipseSize1 = 50;
    
    noFill();
    //noStroke();
    stroke(float(k)/num * 204.0 + 51);
    strokeWeight(.09*range);
    //stroke(0,255, 255, .3*val);
    //fill(51,51,255, .3*val);
    //fill(0,255, 255, .3*val);
    //fill(10,200, 10, .3*val);
    //line(ax1[k-1], ay1[k-1], ax1[k], ay1[k]);
    //stroke(val);
    //line(ax[k-1], ay[k-1], ax[k], ay[k]);
    ellipse(ax[k] - offset, height-ay[k], ellipseSize,ellipseSize1);
    ellipse(width-ay[k] + offset, height-ax[k], ellipseSize,ellipseSize1);
    //ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay[k]-offset, height-ax[k],ellipseSize,ellipseSize1);
    ellipse( width - ax[k] + offset, height-ay[k],ellipseSize,ellipseSize1);
    
    ellipse(ax[k] - offset, ay[k], ellipseSize,ellipseSize1);
    ellipse(width-ay[k] + offset, ax[k], ellipseSize,ellipseSize1);
    //ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay[k]-offset, ax[k],ellipseSize,ellipseSize1);
    ellipse( width - ax[k] + offset, ay[k],ellipseSize,ellipseSize1);
  }
}
