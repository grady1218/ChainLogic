class FieldMap extends DrawBase{
	
	PuyoPuyo[] puyo = new PuyoPuyo[3];

	Field field;
	
	int fieldX = 400;
	int fieldY = fieldX * 2;

	FieldMap( int fx, int fy ){
		size = fieldX / 6.0;
		x = fx;
		y = fy;
		field = new Field( fieldX, fieldY );
		puyo[0] = new PuyoPuyo( 0, 2, 3, size );
		puyo[1] = new PuyoPuyo( 1, 4, 1, size );
		puyo[2] = new PuyoPuyo( 2, 4, 1, size );
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

	void movePuyo( int x, int y ){
		for( PuyoPuyo p: puyo ){
			p.move( x, y );
		}
	}

}