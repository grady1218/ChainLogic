class FieldMap extends DrawBase{
	
	Field field;
	PuyoPuyo puyo[] = new PuyoPuyo[3];
	
	int fieldX = 400;
	int fieldY = fieldX * 2;

	int fieldArray[][] = new int[8][15];

	FieldMap( float fx, float fy ){
		size = fieldX / 6.0;
		x = fx;
		y = fy;
		field = new Field( fieldX, fieldY );
		puyo[0] = new PuyoPuyo( 0, 0, 0, size );
		puyo[1] = new PuyoPuyo( 1, 2, 0, size );
		puyo[2] = new PuyoPuyo( 2, 4, 0, size );
	}
	@Override
	void draw(){
		translate( x, y );
		field.draw();
		for( int c = 0; c < puyo.length; c++ ){
			puyo[c].draw();
		}
		translate( -x, -y );
	}
}