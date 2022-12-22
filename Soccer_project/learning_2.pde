boolean clicked;
boolean entered;
int unit = height/11;
public int x_val;
public int y_val;

Field f;
PImage img;
PImage img2;
PImage dude;
PImage goal;

int num_1 = 0;
int num_2 = 0;

String str_num = "";

void setup(){
  size(1100, 1100);
  img = loadImage("boxes.jpg");
  img2 = loadImage("scball1.jpeg");
  dude = loadImage("player1.jpeg");
  goal = loadImage("goalbox.jpeg");
  textSize(30);
 

  f = new Field();

}

void draw(){
  image(img, 0, 0, width, height);
  image(img2, 507, 507, width/13, height/13);
  if (clicked){
    image(dude, x_val-50, y_val-50, 100, 100);
    image(goal, 1000, f.int_random * 100, 100, 500);
    if (f.outcome){
      fill(0, 102, 51);
      text(f.data, 170, 150);
      text("yayyy", 500, 190);
    }
    else{
      fill(204, 0, 0);
      text(f.data, 170, 150);
      text("Oh NOO!", 500, 190);
    }
  }  
  if (entered){
    image(dude, ((num_1-1)*100)+8, ((num_2-1)*100), 100, 100);
    image(goal, 1000, f.int_random * 100, 100, 500);
    if (f.outcome){
      fill(0, 102, 51);
      text(f.data, 170, 150);
      text("yayyy", 500, 190);
    }
    else{
      fill(204, 0, 0);
      text(f.data, 170, 150);
      text("Oh NOO!", 500, 190);
    }
    
  }
}


void keyPressed(){

  if( key >= '0' && key <= '9' ){
   str_num += key; 
  }
  if( key == ENTER || key == RETURN ){
    if (num_1 == 0){
      num_1 = int( str_num );
      str_num = "";
      println( num_1 );
      println( num_2 );
    }
    else {
      num_2 = int( str_num );
      str_num = "";
      f.goal(num_1, num_2);
      println( num_1 );
      println( num_2 );
      entered = true;
    }
  }
}

void mouseClicked() {
  clicked = true;
  x_val = mouseX;
  y_val = mouseY;
  println(x_val);
  println(y_val);
  int row = (mouseY/100) + 1;
  int column = (mouseX/100) + 1;
  println(column + " column");
  println(row + " row");
  f.goal(column, row);
}
