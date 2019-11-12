class PuyoPuyo extends DrawBase{

	String direction = "up";
	
	Puyo[] puyo = new Puyo[2];
	Puyo[][] puyoData;

	int groundingTime = 0;
	int groundingTimeLimit = 80;
	boolean isGrounding = false;
	boolean isLimit = false;

	PuyoPuyo( int status, int mx, int my, float size, Puyo[][] p ){
		x = mx;
		y = my;
		puyoData = p;
		puyo[0] = new Puyo( x, y - 1, size, 4, status );
		puyo[1] = new Puyo( x, y, size, 4, status );
	}

	@Override
	void draw(){
		for( Puyo p: puyo )
			p.draw();
	}

	@Override
	void process(){

		getPosition();
		
		if( y >= 13 ) isGrounding = true;
		else if( puyoData[x][y+1] != null ) isGrounding = true;
		else{
			groundingTime = 0;
			for( Puyo p: puyo )
				p.process();
		}

		if( isGrounding ){
			groundingTime++;
		}
		if( groundingTime >= groundingTimeLimit ){
			isLimit = true;
			puyoData[x][y] = puyo[0];
			puyoData[x][y-1] = puyo[1];
		}
	}

	void getPosition(){
		int getNum = 0;

		if( direction == "down" ) getNum = 0; //もし向きが下ならpuyo[0]の座標
		else getNum = 1;

		x = puyo[getNum].getX();
		y = puyo[getNum].getY();
	}

	void decStatus(){
		for( Puyo p : puyo ){
			p.decStatus();
		}		
	}

	void move( int x, int y ){
		for( Puyo p : puyo ){
			p.movePuyo( x, y );
		}
	}

	void setStartPosition( int x, int y ){
			puyo[0].setPotition( x, y - 1 );	
			puyo[1].setPotition( x, y );	
	}

}