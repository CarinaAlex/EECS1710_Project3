int N = 10000;
Random_Ball[] balls = new Random_Ball[N];

PImage subsection;
color spot;

float tolerance = 0.1;
float delta_red;
float delta_green;
float delta_blue;
float color_distance;
boolean red_same;
boolean green_same;
boolean blue_same;

PImage target_img;

void setup() {
	size(1480, 1300, P2D);
  target_img = loadImage("squirrel.png");

	for (int i=0; i<balls.length; i++) {
		balls[i] = new Random_Ball();
	}

}

void draw() {
	background(0,0,0);

	for (int i=0; i<balls.length; i++) {
		balls[i].display();
		balls[i].drift();
		

    spot = target_img.pixels[(int)(balls[i].pos.y)*target_img.width + (int)(balls[i].pos.x)];

    if(colors_equal(balls[i].c, spot)) balls[i].converged();
    else balls[i].count_time();
	}

}

boolean colors_equal(color c1, color c2){
  delta_red = sq((red(c1) - red(c2)) / 255.0);
  delta_green = sq((green(c1) - green(c2)) / 255.0);
  delta_blue = sq((blue(c1) - blue(c2)) / 255.0);
  
  
  
  color_distance = sqrt(3*delta_red + 4*delta_green + 2*delta_blue) / sqrt(9);
  
  return color_distance < tolerance;
  

}
