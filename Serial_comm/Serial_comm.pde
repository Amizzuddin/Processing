import processing.serial.*;

Serial serial;                                  //Create object from Serial class

String sd;

byte p_data = 0;                                 //variable for data to send/received from Processing
byte point = 0;
long hold_time=0;

void setup(){
  size(500,500);
  
  serial = new Serial(this, "COM9", 38400);      //Open the port that the board is connected to and use the same speed (9600)
  serial.bufferUntil('\n');
  
}

void draw(){

}

//called whenever there is something available to read
void serialEvent(Serial serial){
  sd = serial.readStringUntil('\n');
  if(sd != null){
    sd=trim(sd);
    if(sd.equals("Request")){
      serial.write('A');
      serial.clear();
    }
    else{
      println(sd);                              //prints data received aft5er first contact establish
      
    }
  }
}
