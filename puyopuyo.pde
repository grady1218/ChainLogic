class PuyoPuyo extends DrawBase{

	String direction = "up";
	
	Puyo[] puyo = new Puyo[2];
	Puyo[][] puyoData;

	boolean isGrounding = false;

	PuyoPuyo( int status, int mx, int my, float size, Puyo[][] p ){
		x = mx;
		y = my;
		puyoData = p;
		puyo[0] = new Puyo( x, y, size, 4, status );
		puyo[1] = new Puyo( x, y - 1, size, 4, status );
	}

	@Override
	void draw(){
		for( Puyo p: puyo )
			p.draw();
	}

	@Override
	void process(){
		getPosition();
	}

	void getPosition(){
		int getNum = 0;
		if( direction == "down" ) getNum = 0;
		else getNum = 1;
		x = puyo[getNum].getX();
		y = puyo[getNum].getY();
		println("y : "+ y );
	}

	void move( int x, int y ){
		for( Puyo p : puyo ){
			p.movePuyo( x, y );
		}
	}

}