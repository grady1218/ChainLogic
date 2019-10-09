class Puyo extends DrawBase{
	
	int status;
	int puyoColor;
	int puyoColorNum;
	float fallCount = 0;

	Puyo( float mx, float my, float size, int colorNum, int status ){
		x = mx;
		y = my;
		this.size = size;
		this.status = status;
		puyoColorNum = colorNum;
		puyoColor = int( random( 1, puyoColorNum + 1 ) );
	}

	@Override
	void draw(){
		process();
		/*
		ellipseMode(CORNER);
		ellipse( x * size, y * size, size, size );
		*/
		switch( status ){
			case 0:rect( x * size, y * size + fallCount, size, size, 20 );break;		
			case 1:rect( x * size + 200, y * size, size, size, 20 );break;		
			case 2:rect( x * size + 200, y * size + 200, size, size, 20 );break;
			default:break;			
		}
	}

	@Override
	void process(){
		fall();
		selectColor();
	}

	void fall(){
		fallCount += 10;
	}

	void selectColor(){
		switch( puyoColor ){
			case 1:{ fill( #00FF00 ); break; }
			case 2:{ fill( #0000FF ); break; }
			case 3:{ fill( #FF00FF ); break; }
			case 4:{ fill( #FF0000 ); break; }
			case 5:{ fill( #00FFFF ); break; }
			case 6:{ fill( #000000, 20 ); break; }
			default:break;
		}
	}

}