import processing.serial.*; //<>//

Serial serial;      //Create object from Serial class

PFont f;                                        //declare an object type PFont
String sd;                                      //for data received from arduino


int num_typed=0;

boolean first_contact=true;
byte data_ptr = 0;

Car mycar;                                      //declare mycar data type object as a global variable

void setup(){
  size(500,500);
  serial = new Serial(this, "COM9", 38400);  //Open the port that the board is connected to and use the same speed (9600)
  mycar = new Car(color(254,255,23), 0, 0, 0, 0, 0, 0);
}

void draw(){
  cartesian();
  mycar.display();
  
}

//called whenever there is something available to read
void serialEvent(Serial serial){
  sd = serial.readStringUntil('\n');
  if(sd != null){
    sd=trim(sd);
    if(first_contact){                          //only excuete for first connection with arduino
      if(sd.equals("Request")){
        serial.write("A");
        serial.clear();
        first_contact = false;
      }
    }
    else{
      println(sd);                              //prints data received aft5er first contact establish
      if( data_ptr < 7 ){
        data_ptr++;
      }
      else{
       data_ptr = 0; 
      }
    }
  }
}

//called whenever a key is pressed on the keyboard (key = char data type). use as reference to send data to arduino. data send to arduino must be in int format only
void keyReleased(){
  if(key >= '0' && key <= '9'){                               //data are send as a single byte 0-255 only
    num_typed = (byte(num_typed) * 10) + key - '0';
  }
  else if(key == '\n'){
    serial.write(num_typed);
    num_typed = 0;
  }
  else{
    println("Invalid input");
  }
}

void cartesian(){
  background(0);                  //set background as black
  translate(width/2, height/2);   //set origin to the center of the screen
  stroke(127);                    //set cartesian lines as grey
  line(-width, 0, width, 0);      //draw x axis line
  line(0, -height, 0, height);    //draw y axis line
}
