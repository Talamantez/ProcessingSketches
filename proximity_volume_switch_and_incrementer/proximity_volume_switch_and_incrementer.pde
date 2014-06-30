int rssi=80;//signal strength received from performers' xbee module

int onCount = 0;//"On" Counter, counts the time that performers have been close
              //and is used to increment the volume the longer they've been near each other
              
int offCount = 0;//"Off" Counter, counts the time that performers have been apart
              //and is used to decrement the volume the longer they've been apart

int onThreshold = 100;//set the threshold that the "On" Counter has to reach before the volume increments
int offThreshold = 50;//set the threshold that the "Off" Counter has to reach before the volume decrements
float vol = 0.00;//initialize the volume
float onIncrement = 0.01;//amount volume is increased per near time step
float offIncrement = 0.1;//amount volume is decresead per away time step
float volMax = 0.90;//maximum volume
float volMin = 0.00;//minimum volume




//**SECTION HEAD**//
//**The following code increments the volume while the performers are very close
//and decrements it if they are away from each other**//
if(rssi=36){  //if rssi is at its lowest value 
              //(performers are as close as they can get to oneanother
              //run this code:
              
       offCount=0;//set the "Off" Counter to Zero
       
      if(vol=volMax){    //if the volume is maxxed out
                onCount = 0; //set the On counter to 0
                continue;  //and continue with the show
                     }
                     
       else{              //else
                onCount++;//increment the "On" Counter
                      if(onCount>=onThreshold){  //if the "On" Counter reaches the "On" Threshold
                               vol+=onIncrement; //increase the volume
                               onCount = 0;        //and set the "On" Counter to 0
                                              }
                       else{                    //if it hasn't reached the increment threshold yet
                         continue;              //continue with the show
                           }
                           
            }}
else{         //else, if the rssi is not at its lowest value
              //(the performers are away from each other)
              //run this code:
              
   onCount=0; //set the "On" Counter to zero 
   
  if(vol=volMin){//if the volume is minned out
        offCount = 0;//set the "Off" counter to 0
        continue;  //and continue with the show
   } 
  else{    //
          offCount++;//increment the "Off" Counter
                 if(offCount>=offThreshold){ //if the "Off" Counter reaches the "Off" Threshold
                            vol-=offIncrement; //decrease the volume\
                             offCount = 0;       //and set the "Off" Counter to 0
                                            }
                 else{                         //if the "Off" Counter hasn't reached the 
                                               //decrement threshold yet
                      continue;                //continue with the show
                 }                      
   }}   


//**SECTION FOOTER**//   
     
     
     
