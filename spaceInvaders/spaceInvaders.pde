//Space invaders
Player player;
ArrayList<Alien> aliens;
ArrayList<Bullet> bullets;
int score = 0;
//you win you lose timer
int timer = 360;
boolean youWin = false;
boolean youLose = false;

void setup()
{
  size(800,800);
  player = new Player(width,height);
  //
  Alien a1 = new Alien();
  //adding aliens to aliens array
  aliens = a1.alienList(5,15);
  bullets = new ArrayList();
  
}  

void draw()
{
  background(0);
   
  //countdown til exit
  if(youWin || youLose) timer--;
  if(timer <= 0) exit();
  for(int i=0; i<aliens.size();i++)
  {
    aliens.get(i).update();
    //checking if alien hits floor
    if(aliens.get(i).collisionFloorCheck())
    {
      aliens.remove(i);
      i--;
    }
   
  }
  
  //adding bullet to bullets list once player shot
  if(player.shotBullet()){
   bullets.add(new Bullet()); 
  }
  player.outOfBounds();
  player.update();
  
  //updating every bullet in bullets and removing if necessary
  for(int i=0;i<bullets.size();i++)
  {
      //allow to fire if player has less than 10 bullets on screen
      if(bullets.size() >= 10)player.allowedToFire = false;
      else player.allowedToFire = true;
      
      bullets.get(i).update();
      //bullet-walls collision
      if(bullets.get(i).collisionWallCheck())
      {
        bullets.remove(i);
        i--;
        continue;
      }
      //bullet-alien collision
      if(bullets.get(i).collisionAlienCheck(aliens))
      {
       score+=10;
       bullets.remove(i);
       i--;
      }
  }
  textSize(25);
  textAlign(LEFT,TOP);
  text("SCORE: " + score, 0,0);
  text("ENEMIES LEFT: " + aliens.size(), 0,30);
  text("BULLETS: " + (10 - bullets.size()), 0,60);
  
  //check if win
  if(aliens.isEmpty()){
    youWin = true;
    textSize(100);
    fill(0,255,0);
    textAlign(CENTER, CENTER);
    text("YOU WIN",width/2,height/2);
    fill(255);
  }
  //check if player hits alien (if lose)
  if(player.checkAlienCollision(aliens) || youLose)
  {
    youLose = true;
    textSize(100);
    fill(255,0,0);
    textAlign(CENTER, CENTER);
    text("YOU LOSE",width/2,height/2);
    fill(255);
  }
}

void keyPressed()
{
 player.checkingMovement(); 
}

void keyReleased()
{
  player.letGoKey();
}
