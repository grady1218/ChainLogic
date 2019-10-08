class Button extends DrawBase{

	int cSize = width / 8;

	int addCountX = 8;
	int addCountY = 5;

	int fCount = 0;
	int deCount = 0;
	int firstCount = 12;

	char signal;

	boolean isClicked = false;

	Button( char sign, float px, float py ){
		signal = sign;
		x = px;
		y = py;
	}

	@Override
	void draw(){
		fill( #77FF7F );
		process();
		ellipse( x, y, cSize, cSize );
	}

	@Override
	void process(){

		if( !( dist( x, y, mouseX, mouseY ) < ( cSize / 2.0 ) ) ) return;

		if( mousePressed ){
			if( dist( x, y, mouseX, mouseY ) < ( cSize / 2.0 ) && !isClicked ){
				isClicked = true;
				fill( #FFFF7F );

				if( deCount == 0 ){
					deCount = firstCount;
				}else{
					deCount = 4;
				}
				println( signal );
			}

			fCount++;
			if( fCount > deCount ){
				isClicked = false;
				fCount = 0;
				deCount--;
			}
		}else{
			isClicked = false;
			fCount = 0;
			deCount = 0;
		}
	}
}