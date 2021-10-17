class Bullet
{
   int bulletWidth = 8;
   int bulletHeight = 8;
   float posX = player.xPos;
   float posY = player.bodyYPos - (player.collisionHeight/2) - bulletHeight/2;
   float speed = 2;

   void update()
   {
    ellipse(posX,posY, bulletWidth,bulletHeight);
    posY -= speed;
   }
   
   //collision check bullet-walls
   boolean collisionWallCheck()
   {
     if(posY <= 0) return true;
     return false;
   }
   
   //collision check bullet-alien
   boolean collisionAlienCheck(ArrayList<Alien> pAliens)
   {
    for(int i=0; i < pAliens.size(); i++)
    {
     if(posY <= (pAliens.get(i).yPos + pAliens.get(i).bigAlienImageHeight) && 
         posX >= pAliens.get(i).xPos && 
         posX <= (pAliens.get(i).xPos + pAliens.get(i).bigAlienImageWidth))
     {
       pAliens.remove(i);
       return true;
     }
    }
    return false;
   }
}
  
  
