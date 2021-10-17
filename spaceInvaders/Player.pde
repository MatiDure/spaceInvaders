class Player
{
  //positions
  float xPos;
  float bodyYPos;
  float gunYPos;
  //player speed
  float speed = 1.2;
  //body and gun properties
  int bodyWidth = 40;
  int bodyHeight = 20;
  int gunWidth = 8;
  int gunHeight = 20;
  //player hitbox
  int collisionWidth = 40 ;
  int collisionHeight = 60;
  //collisionWidth/2
  float halfCollisionWidth = collisionWidth/2;
  //used to check if player moves or shoots
  boolean moveRight = false;
  boolean moveLeft = false;
  boolean shot = false;
  boolean allowedToFire = true;
  //gun cooldown
  int cooldown = 30;
  
  Player(float pWidth, float pHeight)
  {
    xPos = pWidth/2;
    bodyYPos = pHeight - 10;
    gunYPos = bodyYPos - bodyHeight/2 - gunHeight/2 - 1;
  }
  
  void update()
  {
    pushMatrix();
    translate(xPos,0);
    rectMode(CENTER);
    rect(0,bodyYPos, bodyWidth,bodyHeight);
    rect(0,gunYPos, gunWidth, gunHeight);
    popMatrix(); 
    if(cooldown != 30)cooldown++;
    if(moveRight)xPos += speed;
    if(moveLeft)xPos -= speed;
  }
  
  //shot bullet
  boolean shotBullet(){
   if(key == ' ' && !shot && cooldown == 30 && allowedToFire)
   {
     shot = true;  
     cooldown = 0;
     return true;  
   }
   return false; 
  }
  
  //collision check player-walls
  void outOfBounds()
  {
   if((xPos - halfCollisionWidth) <= 0) xPos = halfCollisionWidth;
   else if((xPos + halfCollisionWidth) >= width) xPos = width - halfCollisionWidth;
  }
  
  //movement check
  void checkingMovement()
  {
    if(key == CODED)
    {
     if(keyCode == RIGHT)
     {
       moveRight = true;
     }
     if(keyCode == LEFT)
     {
       moveLeft = true;
     }
    }
    
  }
  
  //key release check
  void letGoKey()
  {
    //let go space bar
    if(key == ' ')shot = false;
    if(key == CODED)
    {
      //let go right arrow
     if(keyCode == RIGHT)
     {
       moveRight = false;
     }
     //let go left arrow
     if(keyCode == LEFT)
     {
       moveLeft = false;
     }
    }
  }
  
  //collision check player-alien
   boolean checkAlienCollision(ArrayList<Alien> pAliens)
   {
    
    for(int i = 0;i < pAliens.size();i++){
      if(((bodyYPos - halfCollisionWidth) <= (pAliens.get(i).yPos+pAliens.get(i).bigAlienImageHeight)) &&
          ((xPos - halfCollisionWidth) <= (pAliens.get(i).xPos + pAliens.get(i).bigAlienImageWidth)) &&
          (xPos + halfCollisionWidth) >= pAliens.get(i).xPos)
      {
          return true;
      } 
    }
    return false;
  
   }
}
