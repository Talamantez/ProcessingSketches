import pitaru.sonia_v2_9.*;

Sample mySample;

void setup() { 
  size(100,100); 
  Sonia.start(this); 
  mySample = new Sample("will i break_.wav"); 
  
  mySample.play();
  mySample.setVolume(.2) ;
  mySample.repeat(); 
}

  //public void stop(){ 
 // Sonia.stop(); 
 // super.stop(); 
//}
