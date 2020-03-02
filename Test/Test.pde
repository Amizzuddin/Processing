import processing.serial.*;

PFont f;                                        //declare an object type PFont
float zoom = 1.0;

Serial serial;                                  //Create object from Serial class
int[] ard_data = new int[2];//array to store data
int data_pointer = 0;//pointer to data
String c;
boolean token = false;


void setup(){
  size(500,500);
  surface.setResizable(true);
  
  f = loadFont("ArialMT-20.vlw");               //load the font by referencing the font file name
  textFont(f);                                  //specify the font size *if the font not the same size as loaded will cause distortion
  textAlign(CENTER);
  smooth();                                     //enables anti-aliasing
  frameRate(30);                                //set frame rate as 30 frames per sec
  
  for(int i=0; i < ard_data.length; i++){
    ard_data[i] = 0; //initialize the values in the array
  }
  
  serial = new Serial(this, "COM3", 9600);      //Open the port that the board is connected to and use the same speed (9600)
  serial.bufferUntil('\n');
  
  //mycar = new Car(0,0);  //this will be replace with the array version!
}

void draw(){
  //cartesian();
  //radar();
  //mycar.display();
}

//called whenever there is something available to read
void serialEvent(Serial serial){
  c = serial.readStringUntil('\n');
  
  if(c != null){
    c=trim(c);
    if(!token){
      if( c.equals("Arduino") ){
        serial.write("A");
        serial.clear();
        println("Contact");    //acknowledge attempt to contact
        token = true;
      }
    }
    else{
      serial.write("A");
    }
  }
  
}


/*
void cartesian(){
  background(0);                  //set background as black
  translate(width/2, height/2);   //set origin to the center of the screen
  stroke(127);                    //set cartesian lines as grey
  line(-width, 0, width, 0);      //draw x axis line
  line(0, -height, 0, height);    //draw y axis line
}

void radar(){
  float range1 = width*0.25; //radius of range 1 //range circles(Resizable) - improve the range algo
  noFill();
  scale(zoom);
  ellipse(0, 0, range1*2, range1*2); //range 1
  
  //Text to indicate range
  String marker = "Range 1";
  char c_char = '\0';
  float w_char = 0.0;  //check the width of the current character
  float arclength = 0;
  float theta = 0.0;
  for(int i=0; i < marker.length(); i++){
    c_char = marker.charAt(i);
    w_char = textWidth(c_char);  //check the width of the current character
    arclength += w_char/2;
    theta = 1.5*PI+arclength/range1; //printing starts at (0,r) + allowance of the text width
    pushMatrix(); //save the translate before transformation
    translate(range1*cos(theta), range1*sin(theta));
    rotate(theta + PI/2); //rotation offset by 90 deg
    fill(255);
    text(c_char, 0, 0); 
    popMatrix();
    arclength += w_char/2;
  } 
}

void mouseWheel(MouseEvent event){
  zoom += event.getCount()/10.0;
  if(zoom < 0){
   zoom = 0;
  }
}
*/
