import processing.sound.*;
SoundFile file;
PImage spaceship;
PImage blackhole;
PImage space;
PImage alienship;
float x=380;
float [] X = new float [80];
float [] Y = new float [80];
float y = 700;
int scene = 0;

void setup()
{
  size(800, 800);
  for (int i= 0; i<80; i++)
  {
    X[i] = random(0, 800);
    Y[i] = random(-800, 0);
  }
  space = loadImage("space.jpg");
  spaceship = loadImage("spaceship.png");
  alienship = loadImage("alienship.png");
  blackhole = loadImage("blackhole.jpg");
}


void draw()
{

  if (scene== 0)
  {
    game();
  }

  if (scene== 1)
  {
    gameover();
  }
  
  
}

void gameover()
{
  background(blackhole);
  textSize(90);
  text("GameOver", 100, 200);
}
void game()
{

  background(space);
  imageMode(CENTER);
  image(spaceship, x, y, 50, 50);
  imageMode(CORNER);

  if (keyCode == RIGHT)
    x+=4;

  if (keyCode == LEFT)
    x-=4;


  image(alienship, 100, 0, 300, 300);
  image(alienship, 400, 0, 300, 300);
  for (int i= 0; i<80; i++)
  {
    ellipse(X[i], Y[i], 10, 10);
    fill(250, 98, 10);
    Y[i] = Y[i] +7;
    if (Y[i] > height)
    {
      Y[i] =0;
    }
    if (dist(x, y, X[i], Y[i])<20)
    {
      scene = 1;
    }
  }
}
void keyPressed()
{
  if (scene==1)
  {
  if (key =='R' || key =='r')
  {
    scene=0;
    for (int i= 0; i<80; i++)
    {
      X[i] = random(0, 800);
      Y[i] = random(-800, 0);
    }
    
  }
  }
}
