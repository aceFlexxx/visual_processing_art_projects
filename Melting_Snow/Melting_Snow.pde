int num = 200;

int range = 10;
int range1 = 6;
int range2 = 12;

float[] ax1 = new float[num];
float[] ay1 = new float[num]; 

float[] ax = new float[num];
float[] ay = new float[num]; 

float[] ax2 = new float[num];
float[] ay2 = new float[num];
void setup() 
{
  size(1440, 855);
  for(int i = 0; i < num; i++) {
    ax2[i] = width/2;
    ay2[i] = height/2;
    ax1[i] = width/2;
    ay1[i] = height/2;
    ax[i] = width/2;
    ay[i] = height/2;
  }

  frameRate(1000);
}

void draw() 
{
  background(0);
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax2[i-1] = ax2[i];
    ay2[i-1] = ay2[i];
    ax1[i-1] = ax1[i];
    ay1[i-1] = ay1[i];
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }


  // Put a new value at the end of the array1
  ax2[num-1] += random(-range2, range2);
  ay2[num-1] += random(-range2, range2);
  ax1[num-1] += random(-range1, range1);
  ay1[num-1] += random(-range1, range1);
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax2[num-1] = constrain(ax2[num-1], 0, width);
  ay2[num-1] = constrain(ay2[num-1], 0, height);
  ax1[num-1] = constrain(ax1[num-1], 0, width);
  ay1[num-1] = constrain(ay1[num-1], 0, height);
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  

  // Draw a line connecting the points
  for(int k=1; k<num; k++) { 
    

    float offset = 50;
    float val1 = float(k)/num * 204.0 + 51;
    float val = float(k)/num * 204.0 + 51;

    //strokeWeight(.045*val +.045*val1 );
    float ellipseSize = 1/(.008*k);
    float ellipseSize1 = 1/(.008*k);
    strokeWeight(.2*range);
    stroke(0,255, 255, .3*val);
    //fill(51,51,255, .3*val);
    fill(0,255, 255, .3*val);
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
    
    
    
    ellipseSize = (ax1[k-1] - ax1[k]);
    
    strokeWeight(.2*range1);
    stroke(255,0,127, val1);
    //fill(180,100, val1, val1);
    //fill(51,51,255, .3*val);
    fill(255,0,127, val1);
    ellipse(ax1[k] - offset, height-ay1[k], ellipseSize,ellipseSize);
    ellipse(width-ay1[k] + offset, height-ax1[k], ellipseSize,ellipseSize);
    //ellipse( ay1[k], ax1[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay1[k]-offset, height-ax1[k],ellipseSize,ellipseSize);
    ellipse( width - ax1[k] + offset, height-ay1[k],ellipseSize,ellipseSize);
    
    ellipse(ax1[k] - offset, ay1[k], ellipseSize,ellipseSize);
    ellipse(width-ay1[k] + offset, ax1[k], ellipseSize,ellipseSize);
    //ellipse( ay1[k], ax1[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay1[k]-offset, ax1[k],ellipseSize,ellipseSize);
    ellipse( width - ax1[k] + offset, ay1[k],ellipseSize,ellipseSize);
    
    
    ellipseSize = (ax2[k-1] - ax2[k]);
    strokeWeight(.2*range2);
    stroke(10,200, 10, val);
    fill(10,200, 10, val);
    line(ax2[k] - offset, height-ay2[k], ax2[k-1] - offset,height-ay2[k-1]);
    line(width-ay2[k] + offset, height-ax2[k], width-ay2[k-1] + offset,height-ax2[k-1]);
    //ellipse( ay2[k], ax2[k] + 100, ellipseSize,ellipseSize);
    line( ay2[k]-offset, height-ax2[k],ay2[k-1]-offset,height-ax2[k-1]);
    line( width - ax2[k] + offset, height-ay2[k],width - ax2[k-1] + offset,height-ay2[k-1]);
    
    line(ax2[k] - offset, ay2[k], ax2[k-1] - offset,ay2[k-1]);
    line(width-ay2[k] + offset, ax2[k], width-ay2[k-1] + offset,ax2[k-1]);
    //ellipse( ay2[k], ax2[k] + 100, ellipseSize,ellipseSize);
    line( ay2[k]-offset, ax2[k],ay2[k-1]-offset,ax2[k-1]);
    line( width - ax2[k] + offset, ay2[k],width - ax2[k-1] + offset,ay2[k-1]);
  }
}
