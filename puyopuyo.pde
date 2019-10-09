class PuyoPuyo extends DrawBase{
	
	Puyo[] puyo = new Puyo[2];

	PuyoPuyo( int status, int mx, int my, float size ){

		puyo[0] = new Puyo( mx, my, size, 4, status );
		puyo[1] = new Puyo( mx, my + 1, size, 4, status );
	}

	@Override
	void draw(){
		for( int c = 0; c < puyo.length; c++ )
			puyo[c].draw();
	}

}