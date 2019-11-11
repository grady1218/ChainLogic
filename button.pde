class Button extends DrawBase{

	int addCountX = 8;
	int addCountY = 5;

	int firstCountFrame = 12;
	int secondCountFrame = 5;

	int frame = 0;

	char signal;

	boolean isSendSignal = false;
	boolean isFirstMove = true;
	boolean isSecondMove = true;

	Button( char sign, int px, int py ){ //char signal, int x座標, int y座標
		size = width / 8.0;
		signal = sign;
		x = px;
		y = py;
		setFrameCount( sign );
	}

	@Override
	void draw(){
		process();
		ellipseMode( CENTER );
		ellipse( x, y, size, size );
	}

	@Override
	void process(){


		fill( #90FF90 );
		
		boolean isTouched = ( dist( x, y, mouseX, mouseY ) < ( size / 2.0 ) );

		if( !isTouched || !mousePressed ){ init(); return; }
		else if( isTouched && mousePressed ) fill( #55AA5A );


		frame++;

		if( isFirstMove ){
			isFirstMove = false;
			isSendSignal = true;
		}
		else if( isSecondMove && frame == firstCountFrame ){
			isSecondMove = false;
			isSendSignal = true;
			frame = 0;
		}
		else if( !isSecondMove && frame == secondCountFrame ){
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

	void setFrameCount( char s ){

		if( s == kc.getKey( "left" ) || s == kc.getKey( "right" ) ){
			firstCountFrame = 12;
			secondCountFrame = 5;
		}
		else if( s == kc.getKey( "down" ) ){
			firstCountFrame = 2;
			secondCountFrame = 1;
		}
	}

	char getSignal(){
		return signal;
	}
}