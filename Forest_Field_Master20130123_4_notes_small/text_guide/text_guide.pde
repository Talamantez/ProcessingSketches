//Each time the dancers come close, a new note sounds and sustains

//They come close once
  //Sound G
//They come close twice
  //Sound C
//They come close thrice
  //Sound F
  
  int farCount = 0;
  int closeCount = 1: 
  switchG=0;
  switchC=0;
  switchF=0;
  
  if (rssi<=36 && farCount>=closeCount){
          closeCount+=1;
                                       }
                                       
  if (rssi>=70 && closeCount>=farCount){
          farCount+=1;
                                       }
 
  if (closeCount = 2){
             switchG=1;
             switchC=0;
             switchF=0;
  }
  
  if (closeCount = 3){
             switchG=1;
             switchC=1;
             switchF=0;
  }
                                    
  if (closeCount = 4){
             switchG=1;
             switchC=1;
             switchF=1;
  }   
  
