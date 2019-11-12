class FieldMap extends DrawBase{
	
	PuyoPuyo[] puyo = new PuyoPuyo[3];

	Puyo[][] puyoData;

	Field field;
	
	int fieldX = 400;
	int fieldY = fieldX * 2;

	FieldMap( int fx, int fy, Puyo[][] p ){
		size = fieldX / 6.0;
		x = fx;
		y = fy;
		puyoData = p;
		field = new Field( fieldX, fieldY, p );
		puyo[0] = new PuyoPuyo( 0, 2, 3, size, p );
		puyo[1] = new PuyoPuyo( 1, 4, 1, size, p );
		puyo[2] = new PuyoPuyo( 2, 4, 1, size, p );
	}
	@Override
	void draw(){
		translate( x, y );
		field.draw();
		for( PuyoPuyo p: puyo ){
			p.draw();
		}
		translate( -x, -y );
	}
	@Override
	void process(){
		for( PuyoPuyo p: puyo ){
			p.process();
		}	
		puyo[0].getPosition();
		if( puyo[0].isLimit ) next();
	}

	void movePuyo( int x, int y ){

		for( PuyoPuyo p: puyo ){
			p.move( x, y );
		}
	}

	void next(){
			puyo[0].decStatus();
		for( int c = 0; c < 2; c++ ){
			puyo[c] = puyo[c+1];
			puyo[c].decStatus();
		}
		puyo[2] = new PuyoPuyo( 2, 4, 1, size, puyoData );
		puyo[0].setStartPosition( 2, 3 );
	}

}