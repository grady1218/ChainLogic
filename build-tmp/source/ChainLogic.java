import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ChainLogic extends PApplet {

Player player;

public void setup() {
	
	player = new Player();
}


public void draw() {
	player.draw();
}
class Player{

	Button button[] = new Button[4];
	DrawBase fieldMap;

	int fieldArray[][] = {
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 }
	};
	
	Player(){
		fieldMap = new FieldMap( 100, 100 );
		button[0] = new Button( 'a', 50, 700 );
		button[1] = new Button( 's', 50, 820 );
		button[2] = new Button( 'd', 650, 700 );
		button[3] = new Button( 's', 650, 820 );
	}

	public void draw(){
		fieldMap.draw();
		process();
	}

	public void process(){
		for( Button b : button ){
			b.draw();
			if( !b.isSendSignal ) continue;
		}
	}
}
class DrawBase{

	int x;
	int y;
	float size;

	public void draw(){
	}

	public void process(){
	}

}
class Button extends DrawBase{

	int addCountX = 8;
	int addCountY = 5;

	int frame = 0;

	char signal;

	boolean isSendSignal = false;
	boolean isFirstMove = true;
	boolean isSecondMove = true;

	Button( char sign, int px, int py ){
		size = width / 8.0f;
		signal = sign;
		x = px;
		y = py;
	}

	public @Override
	void draw(){
		process();
		ellipseMode(CENTER);
		ellipse( x, y, size, size );
	}

	public @Override
	void process(){


		fill( 0xff90FF90 );
		
		boolean isTouched = ( dist( x, y, mouseX, mouseY ) < ( size / 2.0f ) );

		if( !isTouched || !mousePressed ){ init(); return; }
		else if( isTouched &&  mousePressed ) fill( 0xff55AA5A );


		frame++;

		if( isFirstMove ){
			isFirstMove = false;
			isSendSignal = true;
		}
		else if( isSecondMove && frame == 12 ){
			isSecondMove = false;
			isSendSignal = true;
			frame = 0;
		}
		else if( !isSecondMove && frame == 5 ){
			frame = 0;
			isSendSignal = true;
		}
		else isSendSignal = false;

	}

	public void init(){
		frame = 0;
		isFirstMove = true;
		isSecondMove = true;
		isSendSignal = false;
	}

	public char getSignal(){
		return signal;
	}
}
class Field extends DrawBase{

	Field( int xSize, int ySize ){
		x = xSize;
		y = ySize;
	}

	public @Override
	void draw(){
		strokeWeight( 10 );
		stroke( 0xff7777FF );

		background( 0xffAADDEE );
		fill( 0xff777777 );
		rect( 0, 0, x, y );
	
		strokeWeight( 1 );
		stroke( 0xff000000 );

	}

}
class FieldMap extends DrawBase{
	
	Field field;
	PuyoPuyo puyo[] = new PuyoPuyo[3];
	
	int fieldX = 400;
	int fieldY = fieldX * 2;

	FieldMap( int fx, int fy ){
		size = fieldX / 6.0f;
		x = fx;
		y = fy;
		field = new Field( fieldX, fieldY );
		puyo[0] = new PuyoPuyo( 0, 2, 3, size );
		puyo[1] = new PuyoPuyo( 1, 4, 1, size );
		puyo[2] = new PuyoPuyo( 2, 4, 1, size );
	}
	public @Override
	void draw(){
		translate( x, y );
		field.draw();
		for( int c = 0; c < puyo.length; c++ ){
			puyo[c].draw();
		}
		translate( -x, -y );
	}
}
class Puyo extends DrawBase{
	
	int status;
	int puyoColor;
	int puyoColorNum;
	float fallSpeed = 0;

	Puyo( int mx, int my, float size, int colorNum, int status ){
		x = mx;
		y = my;
		this.size = size;
		this.status = status;
		puyoColorNum = colorNum;
		puyoColor = PApplet.parseInt( random( 1, puyoColorNum + 1 ) );
	}

	public @Override
	void draw(){
		process();
		/*
		ellipseMode(CORNER);
		ellipse( x * size, y * size, size, size );
		*/
		switch( status ){
			case 0:rect( x * size, y * size + fallSpeed, size, size, 20 );break;		
			case 1:rect( x * size + 200, y * size, size, size, 20 );break;		
			case 2:rect( x * size + 200, y * size + 200, size, size, 20 );break;
			default:break;			
		}
	}

	public @Override
	void process(){
		fall();
		selectColor();
	}

	public void fall(){
		if( status != 0 ) return;
		fallSpeed += 1;
		if( fallSpeed >= size ){
			fallSpeed = 0;
			y++;
		}
	}

	public void rotation( int mx, int my ){
		if( status != 0 ) return;
		x += mx;
		y += my;
	}

	public void setPotition( int mx, int my ){
		x = mx;
		y = my;
	}

	public void decStatus(){
		status--;
	}

	public float getX(){
		return x;
	}

	public float getY(){
		return y;
	}

	public void selectColor(){
		switch( puyoColor ){
			case 1:{ fill( 0xff00FF00 ); break; }
			case 2:{ fill( 0xff0000FF ); break; }
			case 3:{ fill( 0xffFF00FF ); break; }
			case 4:{ fill( 0xffFF0000 ); break; }
			case 5:{ fill( 0xff00FFFF ); break; }
			case 6:{ fill( 0xff000000, 20 ); break; }
			default:break;
		}
	}

}
class PuyoPuyo extends DrawBase{

	String direction = "up";
	
	Puyo[] puyo = new Puyo[2];

	PuyoPuyo( int status, int mx, int my, float size ){
		x = mx;
		y = my;
		puyo[0] = new Puyo( x, y, size, 4, status );
		puyo[1] = new Puyo( x, y - 1, size, 4, status );
	}

	public @Override
	void draw(){
		for( int c = 0; c < puyo.length; c++ )
			puyo[c].draw();
	}

	public @Override
	void process(){

	}

}
  public void settings() { 	size( 700, 1200, JAVA2D ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ChainLogic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
