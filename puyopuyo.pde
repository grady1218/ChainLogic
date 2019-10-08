class PuyoPuyo extends DrawBase{
	
	Puyo[] puyo = new Puyo[2];

	PuyoPuyo( int status, int mx, int my, float cSiz ){

		puyo[0] = new Puyo( mx, my, cSiz, 4 );
		puyo[1] = new Puyo( mx + 1, my, cSiz, 4 );
	}

	@Override
	void draw(){
		for( int c = 0; c < puyo.length; c++ )
			puyo[c].draw();
	}

}