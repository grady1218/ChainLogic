class Button extends DrawBase{

	int addCountX = 8;
	int addCountY = 5;

	int frame = 0;

	char signal;

	boolean isSendSignal = false;
	boolean isFirstMove = true;
	boolean isSecondMove = true;

	Button( char sign, int px, int py ){
		size = width / 8.0;
		signal = sign;
		x = px;
		y = py;
	}

	@Override
	void draw(){
		process();
		ellipseMode(CENTER);
		ellipse( x, y, size, size );
	}

	@Override
	void process(){


		fill( #90FF90 );
		
		boolean isTouched = ( dist( x, y, mouseX, mouseY ) < ( size / 2.0 ) );

		if( !isTouched || !mousePressed ){ init(); return; }
		else if( isTouched &&  mousePressed ) fill( #55AA5A );


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

	void init(){
		frame = 0;
		isFirstMove = true;
		isSecondMove = true;
		isSendSignal = false;
	}

	char getSignal(){
		return signal;
	}
}