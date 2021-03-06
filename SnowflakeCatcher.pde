Snowflake [] storm;
Catcher bar=new Catcher();

void setup()
{
  size (500, 500);
  background(0);
  noStroke();
  storm = new Snowflake[100];
  for (int i=0; i<storm.length; i++)
  {
    storm[i]=new Snowflake();
  }
}

void draw()
{
  for (int i=0; i<storm.length; i++)
  {
    storm[i].erase();
    storm[i].lookDown();
    storm[i].move();
    storm[i].wrap();
    storm[i].show();
  }
  bar.erase2();
  bar.keyPressed();
  bar.show2();
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x=(int)(Math.random()*500);
    y=(int)(Math.random()*500);
    isMoving=true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 12, 12);
  }
  void lookDown()
  {
    if (y>0 && y<500 && ((get(x+6, y+6))!=color(0) || (get(x-6, y+6))!=color(0)))
    {
      isMoving=false;
    } else
    {
      isMoving=true;
    }
  }
  void move()
  {
    if (isMoving==true)
    {
      y=y+(int)(Math.random()*3+1);
    }
  }
  void wrap()
  {
    if ((y+6)>=500)
    {
      y=0;
      x=(int)(Math.random()*500);
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 10, 10);
  }
}

class Catcher
{
  int x2;
  Catcher()
  {
    x2=(int)(Math.random()*500);
  }
  void erase2()
  {
    noStroke();
    fill(0);
    rect(x2,400,85,25);
  }
  void show2()
  {
    noStroke();
    fill((int)(Math.random()*500), (int)(Math.random()*500), (int)(Math.random()*500));
    rect(x2, 400, 80, 20);

  }
  void keyPressed()
  {
    if (key=='a')
    {
      x2-=2;
      if (x2<0)
      {
        x2=0;
      }
    }
    else if (key=='s')
    {
      x2+=2;
      if (x2>420)
      {
        x2=420;
      }
    }
  }
}

