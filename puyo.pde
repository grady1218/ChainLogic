class Puyo extends DrawBase{
	
	int puyoColor;
	int puyoColorNum;

	Puyo( float mx, float my, float size, int colorNum ){
		x = mx;
		y = my;
		this.size = size;
		puyoColorNum = colorNum;
		puyoColor = int( random( 0, puyoColorNum ) );
	}

	@Override
	void draw(){
		selectColor();
		/*
		ellipseMode(CORNER);
		ellipse( x * size, y * size, size, size );
		*/
		rect( x * size, y * size, size, size, 20 );
	}

	void selectColor(){
		switch( puyoColor ){
			case 0:{ fill( #FF0000 ); break; }
			case 1:{ fill( #00FF00 ); break; }
			case 2:{ fill( #0000FF ); break; }
			case 3:{ fill( #FF00FF ); break; }
			case 4:{ fill( #00FFFF ); break; }
			case 5:{ fill( #000000, 20 ); break; }
			default:break;
		}
	}

}