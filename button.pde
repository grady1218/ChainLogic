class Button extends DrawBase{

	int addCountX = 8;
	int addCountY = 5;

	int fCount = 0;
	int deCount = 0;
	int firstCount = 12;

	char signal;

	boolean isClicked = false;
	boolean isSendSignal = false;

	Button( char sign, float px, float py ){
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

		boolean isTouched = ( dist( x, y, mouseX, mouseY ) < ( size / 2.0 ) );

		isSendSignal = false;

		fill( #77FF7F );

		if( !isTouched ) return;

		if( mousePressed ){
			
			if( !isClicked ){
				isClicked = true;
				fill( #FFFF7F );

				if( deCount == 0 ){
					deCount = firstCount;
					isSendSignal = true;
				}else{
					deCount = 4;
				}
			}

			fCount++;
			if( fCount > deCount ){
				isClicked = false;
				fCount = 0;
				deCount--;
			}
		}
		else{
			isClicked = false;
			fCount = 0;
			deCount = 0;
		}
	}
	char getSignal(){

		if( isSendSignal ){
			return signal;
		}else{
			return 'N';
		}
	}
}