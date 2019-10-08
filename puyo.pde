class Puyo extends DrawBase{

	float cSize;
	int puyoColor;
	int puyoColorNum;

	Puyo( float px, float py, float size, int colorNum ){
		x = px;
		y = py;
		cSize = size;
		puyoColorNum = colorNum;
		puyoColor = int( random( 0, puyoColorNum ) );
	}

	@Override
	void draw(){
		selectColor();
		ellipse( x*cSize, y*cSize, cSize, cSize );
	}

	void selectColor(){
		switch( puyoColor ){
			case 0:{ fill( #FF0000 ); break; }
			case 1:{ fill( #00FF00 ); break; }
			case 2:{ fill( #0000FF ); break; }
			case 3:{ fill( #FF00FF ); break; }
			case 4:{ fill( #000000, 20 ); break; }
			case 5:{ fill( #00FFFF ); break; }
			default:break;
		}
	}

}