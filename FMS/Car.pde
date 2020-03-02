/*class Car declaration*/

class Car{
  //Variables
  color c;
  int xpos;
  int ypos;
  int direction;
  int speed1;
  int speed2;
  double scan_obj_distance;
  
  
  //Constructor - need to be the same name as the class itself!
  Car(color _c, int _xpos, int _ypos, int _direction, int _speed1, int _speed2, double _scan_obj_distance){
    c = _c;
    xpos = _xpos;
    ypos = _ypos;
    direction = _direction;
    speed1 = _speed1;
    speed2 = _speed2;
    scan_obj_distance = _scan_obj_distance;
  }
  
  void display(){
    //println("x:" + xpos + ",y:" + ypos);
    //stroke(0);
    fill(c);
    ellipse(xpos, ypos, 20, 20);
    //fill(255);
    //textFont(f, obj_dis/2);    
    //text( "(" + xpos + "," + ypos + ")", xpos, ypos+obj_dis);
  }
  void update(){
    print();
  }
  
}
