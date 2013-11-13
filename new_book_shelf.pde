import peasy.*;

PeasyCam cam;

int pressing=0;

int open_status=0;//0:close 1:opening 2:open 3:closing

float move_z=0;
int z_OK=0;
float move_x=0;
int x_OK=0;

int move=0;
int move_back=0;

int up_status=0;//0:down 1:going up 2:up 3:going down

float up_y=0;

void setup(){
  size(700,500,P3D);
  smooth();
  cam=new PeasyCam(this,200);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(500);
  textSize(10);
  textAlign(LEFT);
}

void draw(){
  move();
  background(255);
  fill(0);
  text("Use \"Enter\" to press red button (open or close shelf)",-118,40);
  text("Use \"Space\" to press blue button (rise or drop shelf)",-118,50);
  hole_shelf();
}

void keyTyped(){
  if(pressing==0){
        pressing=1;
    if(key==ENTER){
        switch(open_status){
          case 0:move=1;move_back=0;open_status=1;break;
          case 1:
          if(move==1){
            move=0;
          }else{
            move=1;
          }
          move_back=0;break;
          case 2:move=0;move_back=1;open_status=3;break;
          case 3:move=0;
          if(move_back==0){
            move_back=1;
          }else{
            move_back=0;
          }
          break;
          default:break;
        }
    }else if(key==' '){
      switch(up_status){
        case 0:up_status=1;break;
        case 1:up_status=0;break;
        case 2:up_status=3;break;
        case 3:up_status=2;break;
        default:break;
      }
    }
  }
}

void keyReleased(){
  pressing=0;
}

void move(){
  //move
  if(move==1){
    if(z_OK==0){
      if(move_z<46){
        move_z=move_z+0.5;
      }else{
        z_OK=1;
      }
    }
    if(z_OK==1){
      if(move_x>-76){
        move_x=move_x-0.5;
      }else{
        z_OK=0;
        move=0;
        move_back=0;
        open_status=2;
      }
    }
  }
  //move back
  if(move_back==1){
     if(x_OK==0){
       if(move_x<0){
          move_x=move_x+0.5;
       }else{
         x_OK=1;
       }
     }
     if(x_OK==1){
        if(move_z>0){
           move_z=move_z-0.5;
         }else{
           x_OK=0;
           move_back=0;
           move=0;
           open_status=0;
         }
       }
  }
  
  if(up_status==1){
    if(up_y>-20){
      up_y-=0.5;
    }else{
      up_status=2;
    }
  }
  if(up_status==3){
    if(up_y<0){
      up_y+=0.5;
    }else{
      up_status=0;
    }
  }
}

void fix_fix_right_bookshelf(){
  //front shelf
  translate(0,0,11);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,-0.5);
  //column right
  translate(33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,-0.5);
  
  //up_button
  //button front
  translate(36.5,0,11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,-11.6);
  
  //column left
  translate(-36.6,0.9,0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(36.6,-0.9,-0.5);
  //column right
  translate(36.6,0.9,0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(-36.6,-0.9,-0.5);
  //
  translate(0,0,-11);
  
  //center block
  translate(0,0.9,0.5);
  fill(0,197,205);
  box(70.2,45,1);
  translate(0,-0.9,-0.5);
  translate(0,0.9,-0.5);
  fill(0,197,205);
  box(70.2,45,1);
  translate(0,-0.9,0.5);
  
  //back shelf
  translate(0,0,-11);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,0.5);
  //column right
  translate(33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,0.5);
  
  //up_button
  //button back
  translate(36.5,0,-11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,11.6);
  
  //column left
  translate(-36.6,0.9,-0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(36.6,-0.9,0.5);
  //column right
  translate(36.6,0.9,-0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(-36.6,-0.9,0.5);
  //
  translate(0,0,11);
  
  //button front
  translate(-36.5,0,22.6);
  fill(255,0,0);
  box(2,2,1);
  translate(36.5,0,-22.6);
  //button back
  translate(-36.5,0,-22.6);
  fill(255,0,0);
  box(2,2,1);
  translate(36.5,0,22.6);
}

void fix_fix_left_bookshelf(){
  //front shelf
  translate(0,0,11);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,-0.5);
  //column right
  translate(33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,-0.5);
  
  //up_button
  //button front
  translate(36.5,0,11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,-11.6);
  
  //column left
  translate(-36.6,0.9,0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(36.6,-0.9,-0.5);
  //column right
  translate(36.6,0.9,0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(-36.6,-0.9,-0.5);
  //
  translate(0,0,-11);
  
  //center block
  translate(0,0.9,0.5);
  fill(0,197,205);
  box(70.2,45,1);
  translate(0,-0.9,-0.5);
  translate(0,0.9,-0.5);
  fill(0,197,205);
  box(70.2,45,1);
  translate(0,-0.9,0.5);
  
  //back shelf
  translate(0,0,-11);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,0.5);
  //column right
  translate(33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,0.5);
  
  //up_button
  //button back
  translate(36.5,0,-11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,11.6);
  
  //column left
  translate(-36.6,0.9,-0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(36.6,-0.9,0.5);
  //column right
  translate(36.6,0.9,-0.5);
  fill(78,238,148);
  box(3,45,21);
  translate(-36.6,-0.9,0.5);
  //
  translate(0,0,11);
}

void move_shelf(){
  //front shelf
  translate(0,0,11);
  translate(0,up_y,0);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
    
    translate(-35,-1.5,10.1);
    if(move==1 || move_back==1 || up_status==1 || up_status==3){
      fill(255,0,0);
    }else{
      fill(255);
    }
    rect(0,0,70,3);
    translate(35,1.5,-10.1);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,-0.5);
  //column right
  translate(33.6,0,0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,-0.5);
  
  //center block
  translate(0,0,-10.5);
  fill(0,197,205);
  box(70.2,43,1);
  translate(0,0,10.5);
  
  translate(0,-up_y,0);
  
  //up_button
  //button front
  translate(36.5,0,11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,-11.6);
  
  //column left
  translate(-36.6,0,0.5);
  fill(78,238,148);
  box(3,43.6,21);
  translate(36.6,0,-0.5);
  //column right
  translate(36.6,0,0.5);
  fill(78,238,148);
  box(3,43.6,21);
  translate(-36.6,0,-0.5);
  //
  translate(0,0,-11);
  
  //center block
  translate(0,0,-0.5);
  fill(0,197,205);
  box(70.2,43,1);
  translate(0,0,0.5);
  
  //back shelf
  translate(0,0,-11);
  //row
  translate(0,-30,0);
  for(int i=0;i<5;i++){
    translate(0,10,0);
    fill(255);
    box(70,3,20);
    
    translate(-35,-1.5,-10.1);
    if(move==1 || move_back==1){
      fill(255,0,0);
    }else{
      fill(255);
    }
    rect(0,0,70,3);
    translate(35,1.5,10.1);
  }
  translate(0,-20,0);
  
  //column left
  translate(-33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(33.6,0,0.5);
  //column right
  translate(33.6,0,-0.5);
  fill(255,128,0);
  box(3,43.6,21);
  translate(-33.6,0,0.5);
  
  //up_button
  //button back
  translate(36.5,0,-11.6);
  fill(0,0,255);
  box(2,2,1);
  translate(-36.5,0,11.6);
  
  //column left
  translate(-36.6,0,-0.5);
  fill(78,238,148);
  box(3,43.6,21);
  translate(36.6,0,0.5);
  //column right
  translate(36.6,0,-0.5);
  fill(78,238,148);
  box(3,43.6,21);
  translate(-36.6,0,0.5);
  //
  translate(0,0,11);
  
  //wheel left font
  translate(36.5,22.5,22);
  stroke(255,0,0);
  sphere(1);
  stroke(0);
  translate(-36.5,-22.5,-22);
  //wheel right font
  translate(-36.5,22.5,22);
  stroke(255,0,0);
  sphere(1);
  stroke(0);
  translate(36.5,-22.5,-22);
  //wheel left back
  translate(36.5,22.5,-22);
  stroke(255,0,0);
  sphere(1);
  stroke(0);
  translate(-36.5,-22.5,22);
  //wheel right back
  translate(-36.5,22.5,-22);
  stroke(255,0,0);
  sphere(1);
  stroke(0);
  translate(36.5,-22.5,22);
}

void hole_shelf(){
  //left fix_fix_right_bookshelf
  translate(-76.1,0,0);
  fix_fix_left_bookshelf();
  translate(76.1,0,0);
  //center move bookshelf
  translate(move_x,0,move_z);
  move_shelf();
  translate(-move_x,0,-move_z);
  //right fix_fix_right_bookshelf
  translate(76.1,0,0);
  fix_fix_right_bookshelf();
  translate(-76.1,0,0);
}
