class FieldMap extends DrawBase{
	
	Field field;
	PuyoPuyo puyo[] = new PuyoPuyo[3];
	
	int fieldArray[][] = new int[8][15];

	FieldMap( float x, float y ){
		field = new Field( x, y );
		puyo[0] = new PuyoPuyo( 0, 1, 1 );
		puyo[1] = new PuyoPuyo( 1, 2, 2 );
		puyo[2] = new PuyoPuyo( 2, 3, 3 );
	}
	@Override
	void draw(){
		field.draw();
		for( int c = 0; c < puyo.length; c++ ){
			puyo[c].draw();
		}
	}
}