
class Line {
  double sx, sy;
  double ex, ey;
  Line(double x1, double y1, double x2, double y2) {
    sx = x1;
    sy = y1;
    ex = x2;
    ey = y2;
  }
}
ArrayList<Line> prev = new ArrayList<Line>();
ArrayList<Line> seg = new ArrayList<Line>();
int len = 512;
int level = 1;
boolean in = false;
color st = color(0, 0, 0);
int drawtime = 100;
int start;

int range = 20;
int num =1000;
//For faster bigger visuals: increase range; lower num
float[] ax = new float[num];
float[] ay = new float[num]; 

color fillcolour1 = 255;
color fillcolour2 = 101;
color fillcolour3 = 50;
float colourincrement1 = 1;
float colourincrement2 = 1;
float colourincrement3 = 1;
int levelFactor = -1;
float divisionFactor = 1;
boolean increasing = false;

void breakSegments(){
  if (len==1) {
    println("Length = 1");
    return;
  }
  
  
  if (level == 6 || level == 1)
  {
    levelFactor*=-1;    
    divisionFactor *= -1;
    increasing = !increasing;
  }
    level += levelFactor;
    len *= pow(2,divisionFactor);
  ArrayList<Line> res = new ArrayList<Line>();
  for (int i=0; i<seg.size(); i++) {
    Line l = seg.get(i);
    double angle = Math.atan2(-(l.ey-l.sy), l.ex-l.sx);
    double angle60 = angle + Math.toRadians(60);
    double anglem60 = angle - Math.toRadians(60);
if(increasing)
{
    if (in) {
      in=!in;
      double x = l.sx, y = l.sy;
      double dx = Math.cos(anglem60)*len, dy = Math.sin(anglem60)*len;
      res.add( new Line( x, y, x+dx, y-dy) );
      x+=dx;
      y-=dy;
      dx = Math.cos(angle)*len;
      dy = Math.sin(angle)*len;
      res.add( new Line( x, y, x+dx, y-dy) );
      x+=dx;
      y-=dy;
      res.add( new Line( x, y, l.ex, l.ey) );
    } else {
      in=!in;
      double x = l.sx, y = l.sy;
      double dx = Math.cos(angle60)*len, dy = Math.sin(angle60)*len;
      res.add( new Line( x, y, x+dx, y-dy) );
      x+=dx;
      y-=dy;
      dx = Math.cos(angle)*len;
      dy = Math.sin(angle)*len;
      res.add( new Line( x, y, x+dx, y-dy) );
      x+=dx;
      y-=dy;
      res.add( new Line( x, y, l.ex, l.ey) );
    }
  }
  }
  prev = seg;
  seg = res;
  start = millis();
}
  
  

void setup() {
  size(1440, 855);
  background(0);
  strokeWeight(0*1);
  fill(255);

  seg.add(new Line((width-len)/2, height-50, (width-len)/2+len, height-50));
  start = millis();
    for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
    }
}

void draw() {
  
  double p = (double)(millis()-start)/(drawtime*level);
  if(p>=1){
    prev = seg;
  }
  background(0);
  textSize(40);
  //text("LEVEL : "+level, 250,70);
  //text("Div: "+ divisionFactor, 250,70);
  //text("Len: "+ len, 250,100);
 // textSize(10);
  //text("SegSize: "+ seg.size(), 250,130);
   // text("Length" + ax.length, 250,150);

  //text("ax: "+ ax[1], 250,150);
  //text("ay: "+ ay[1], 250,180);
  int i;
  for (i=0; len>0 && i<prev.size(); i++) {
    Line l = prev.get(i);
    line(Math.round(l.sx), Math.round(l.sy), Math.round(l.ex), Math.round(l.ey));
  }
  
  if(p<1){
  
  for (i=0; i<seg.size(); i++) {
    if ((double)(i+1)/seg.size() > p)
      break;
    Line l = seg.get(i);
    line(Math.round(l.sx), Math.round(l.sy), Math.round(l.ex), Math.round(l.ey));
  }
  if (i<seg.size()) {
    Line l = seg.get(i);
    double tp =  p*seg.size() - i;
    double tl = tp*len;
    double angle = Math.atan2(-(l.ey-l.sy), l.ex-l.sx);
    line(Math.round(l.sx), Math.round(l.sy), Math.round(l.sx + Math.cos(angle)*tl), Math.round(l.sy - Math.sin(angle)*tl));
  }
  }
 //    Shift all elements 1 place to the left
  for(int j = 1; j < num; j++) {
    ax[j-1] = ax[j];
    ay[j-1] = ay[j];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 2, width);
  ay[num-1] = constrain(ay[num-1], 2, height);
  
  // Draw a line connecting the points
  if (fillcolour1==50 || fillcolour1 == 255) colourincrement1 *= -1;
    fillcolour1=int(fillcolour1 + colourincrement1);
      if (fillcolour2<=50 || fillcolour2 >= 240) colourincrement2 *= -1;
    fillcolour2=int(fillcolour2 + colourincrement2);
          if (fillcolour3==50 || fillcolour3 == 255) colourincrement3 *= -1;
    fillcolour3=int(fillcolour3 + colourincrement3);
  for(int k=1; k<num; k++) {
    //fill(fillcolour2, fillcolour2, fillcolour3);
    float val = .025*(float(k)/num * 204.0 + 51);
    float ellipseSize = .25*(ax[k-1] - ax[k]);
    float offset = 50;
    stroke(fillcolour1, fillcolour2, fillcolour3);
    //line(ax[k-1], ay[k-1], ax[k], ay[k]);
    //if(ax[0] != 350)
    //{
    //stroke(fillcolour2, fillcolour3, fillcolour1);
    
    //filter( BLUR, 0);
    
    //line(ax[k], ay[k], ax[ax.length - k], ay[ay.length - k]);
    //filter( BLUR, 7);
    
    
    //ellipse(ax[k], ay[k], ellipseSize,ellipseSize);
    if(k == ax.length-1)
    {
      //stroke(fillcolour2, fillcolour3, fillcolour1);
      //fill(140, fillcolour2, 120);
      //ellipseSize = 20;
    }
    //ellipse(ax[k], ay[k]+100, ellipseSize,ellipseSize);
    //ellipse(ax[k], ay[k]-100, ellipseSize,ellipseSize);
    //ellipse(ax[k] + 100, ay[k], ellipseSize,ellipseSize);
    if(k <= .25*ax.length)
    { 
      fill(200, 15, 1/ay[k]*200);
      stroke(255, fillcolour3, fillcolour2);
      ellipseSize = .08*val;
    }
    else if ((k <= .5*ax.length)&&(k >.25*ax.length))
    {
            //ellipseSize = .3*val;

      //ellipseSize = .1*val+sqrt(pow((ax[k-1] - ax[k]),2));
      //fill(fillcolour3, fillcolour2, 200);
      //stroke(fillcolour2, 255, fillcolour2);
    }
    else if ((k <= .75*ax.length)&&(k >.5*ax.length))
    {
      //ellipseSize = .2*val+sqrt(pow((ax[k-1] - ax[k]),2));

      fill(120, fillcolour2, fillcolour1);
      stroke(fillcolour3, fillcolour2, fillcolour2);
    }
    else if ((k <= .95*ax.length)&&(k >.75*ax.length))
    {
      //ellipseSize -= .5*val;

         fill(fillcolour3, 25, 200);
         stroke(fillcolour2, fillcolour3, fillcolour2);
    }
    else if((k <= ax.length)&&(k >.95*ax.length))
    {
      //ellipseSize += .3*val;

      stroke(fillcolour2, fillcolour3, fillcolour1);
      fill(fillcolour2, fillcolour2, fillcolour3);
      strokeWeight(0*.35*val);
    }
    noStroke();
    //original line
    //ellipse(ax[k], ay[k], ellipseSize,ellipseSize);
    
    ellipse(ax[k] - offset, height-ay[k], ellipseSize,ellipseSize);
    ellipse(width-ay[k] + offset, height-ax[k], ellipseSize,ellipseSize);
    //ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay[k]-offset, height-ax[k],ellipseSize,ellipseSize);
    ellipse( width - ax[k] + offset, height-ay[k],ellipseSize,ellipseSize);
    
    ellipse(ax[k] - offset, ay[k], ellipseSize,ellipseSize);
    ellipse(width-ay[k] + offset, ax[k], ellipseSize,ellipseSize);
    //ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    ellipse( ay[k]-offset, ax[k],ellipseSize,ellipseSize);
    ellipse( width - ax[k] + offset, ay[k],ellipseSize,ellipseSize);
    
//.....................................
//Last rev was before here.............
//.....................................
    
    //ellipse(ax[k] - offset, ay[k] - width, ellipseSize,ellipseSize);
    //ellipse(ay[k] - height + offset, ax[k] - width, ellipseSize,ellipseSize);
    ////ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    //ellipse( ay[k]-offset, ax[k] - width,ellipseSize,ellipseSize);
    //ellipse(ax[k] + offset - height, ay[k] - width,ellipseSize,ellipseSize);
    
    //ellipse(ax[k] - offset, ay[k], ellipseSize,ellipseSize);
    //ellipse(ay[k] - height + offset, ax[k], ellipseSize,ellipseSize);
    ////ellipse( ay[k], ax[k] + 100, ellipseSize,ellipseSize);
    //ellipse( ay[k]-offset, ax[k],ellipseSize,ellipseSize);
    //ellipse( ax[k] - height + offset, ay[k],ellipseSize,ellipseSize);
    //if(ax[0] != 350)
    //{
      //strokeWeight(0*.5);
      //stroke(255,255,255);
      //line(ax[k] - 100, ay[k],ax[k-1]-100, ay[k-1]); 
      //line(ay[k] - 100, ax[k],ay[k-1]-100, ax[k-1]);
    //}
    //arc(ax[k], ay[k], ax[ax.length - k], ay[ay.length - k], 0 , .5*PI);
   // }fill(fillcolour2, fillcolour2, fillcolour3);

  }
  //fill(fillcolour2, fillcolour2, fillcolour3);
}

void mouseClicked() {
  breakSegments();
   








}
