/**
The code get inspiration from:
https://www.processing.org/examples/lineargradient.html
For linear gradient.
*/
// Constants, globle variables
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() 
{
  size(600, 360);
  // Define colors
  c1 = color(200, 100, 0);
  c2 = color(0, 100, 150);
  noLoop();
}

void draw() 
{
  // Background
  setGradient(0, 0, width/2, height, c1, c2, X_AXIS);
  setGradient(width/2, 0, width/2, height, c2, c1, X_AXIS);
  stroke(0);
  noFill();
  drawCircle(width/2, height/2, 300);
  text("Shuting Sun", 500, 340);
}

// Construct simple linear Gradient
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) 
{
  noFill();
  if (axis == Y_AXIS) 
  {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) 
    {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter); // lerpColor()function is useful for interpolating between two colors
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) 
  {  // Left to right gradient
    for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

//Recursion is used in drawCircles.
void drawCircle(float x, float y, float radius) 
{
  ellipse(x, y, radius, radius);
  if (radius > 2) 
  {
    // drawCircle() calls itself twice, creating a branching effect. 
    // For every circle, a smaller circle is drawn to the left and right.
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
  }
}