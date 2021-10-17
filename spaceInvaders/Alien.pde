class Alien
{
  //images
  PImage bigAlien = loadImage("alien.png");
  PImage smallAlien = loadImage("alien_small.png");
  //size of images
  int bigAlienImageWidth = bigAlien.width;
  int bigAlienImageHeight = bigAlien.height;
  int smallAlienImageWidth = smallAlien.width;
  int smallAlienImageHeight = smallAlien.height;
  //positioning of images on screen
  float xPos;
  float yPos;

  
  void update()
  {
     image(bigAlien, xPos,yPos);
     //every 2 seconds aliens move
     if(second()%2==0)yPos += 0.6;
  }
  
  //collision with player
  boolean collisionPlayerCheck(float playerX, float playerY, 
                          float playerHeight, float playerWidth)
  {
    if(((yPos+bigAlienImageHeight) >= (playerY - playerHeight/2)) && 
         (xPos <= (playerX + playerWidth/2)) && 
          ((xPos+bigAlienImageWidth) >= (playerX - playerWidth/2)))
    {
        return true;
    } 
    return false;
  }
  
  //collision check alien-walls
  boolean collisionFloorCheck()
  {
    if(yPos+bigAlienImageHeight >= height)return true;
    return false;
  }
  
  
  //Returns ArrayList with x amount of aliens with their coordinates
  ArrayList<Alien> alienList(int pMin, int pMax)
  {
      ArrayList<Alien> aliens = new ArrayList();
      int randomAmount = (int) random(pMin, ++pMax);
      int placeHolder;
      
      //adding aliens to list
      for(int i = 0; i < randomAmount; i++)
      {
       aliens.add(new Alien()); 
      }
      //setting coordinates for aliens
      for(int i=0; i<aliens.size(); i++)
      {
      placeHolder = ((i*bigAlienImageWidth) + ((i+1)*10));
      aliens.get(i).xPos = ((i*bigAlienImageWidth) + ((i+1)*10)) % width; 
      aliens.get(i).yPos = (placeHolder / width) * bigAlienImageHeight + ((placeHolder/width + 1) * 20);
      }
      
      return aliens;
  }
  
}
