class PuyoPuyo extends DrawBase{
	
	Puyo[] puyo = new Puyo[2];

	float cSize;

	PuyoPuyo( int status, float fx, float fy ){

		cSize = ( width - fx * 2 ) / 6.0;

		puyo[0] = new Puyo( x, y, cSize, 4 );
		puyo[1] = new Puyo( x + cSize, y, cSize, 4 );
	}

	@Override
	void draw(){
		for( int c = 0; c < puyo.length; c++ )
			puyo[c].draw();
	}

}