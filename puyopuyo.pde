class PuyoPuyo extends DrawBase{

	String direction = "up";
	
	Puyo[] puyo = new Puyo[2];

	PuyoPuyo( int status, int mx, int my, float size ){
		x = mx;
		y = my;
		puyo[0] = new Puyo( x, y, size, 4, status );
		puyo[1] = new Puyo( x, y - 1, size, 4, status );
	}

	@Override
	void draw(){
		for( int c = 0; c < puyo.length; c++ )
			puyo[c].draw();
	}

	@Override
	void process(){

	}

}