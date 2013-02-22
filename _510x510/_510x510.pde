
Cube main; // external large cube


// Size of external cube
float bounds = 255*4; // to correspond with a color system
int bs = 5;
float maxspeed = 1.7;

int x, y, z;
float xs, ys, zs;
float xa, ya, za;
float radius;

void mousePressed(){
 setup();
}

void setup() {
  size(500, 500, P3D);
  background(255);
  
  //cam = new PeasyCam(this, 5000);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
  colorMode(HSB);


  x=y=z=0;
  xs=random(0,maxspeed);
  ys=random(0,maxspeed);
  zs=random(0,maxspeed);
  
  xa=ya=za=0.001;
  
  radius = 100;//random(1,20);
  // Instantiate external large cube
  main =  new Cube(bounds, bounds, bounds);
  //smooth();
}

void draw(){
  //background(255);
  //bounds -= bs;
  //lights();
  
  // Center in display window
  translate(width/2, height/2, -130);
  
  // Outer transparent cube
  noFill(); 
  
  // Rotate everything, including external large cube
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.02);
  rotateZ(frameCount * 0.01);
  stroke(255);
  
  // Draw external large cube
  //main.create();

  // Move and rotate sphere
    pushMatrix();
    translate(x, y, z);
    noStroke();
    //fill(abs(x),abs(y),random(abs(z), abs(z+zs)));
    fill(abs(x)/2,abs(y)/2,abs(z)/2,1);
    sphere(radius);
    x += xs;
    y += ys;
    z += zs;
    popMatrix();

    // Check wall collisions
    if (x > bounds/2-radius || x < -bounds/2+radius){
      xs*=-1;
    }
    if (y > bounds/2-radius || y < -bounds/2+radius){
      ys*=-1;
    }
    if (z > bounds/2-radius || z < -bounds/2+radius){
      zs*=-1;
    }
    
    //print(xs + "+" + xa + "=");
    xs = xs + xa;
    //print(xs + "\n");
    ys+=ya;
    zs+=za;
    
    if(abs(xs) > maxspeed)xa *= -1;
    if(abs(ys) > maxspeed) ya*=-1;
    if(abs(zs) > maxspeed) za*=-1;
    //print(xs + " " + xa + "\n");
    //print(xs + " " + ys + " " + zs + "\n");
      print(x + " " + y + " " + z + "\n");
}

