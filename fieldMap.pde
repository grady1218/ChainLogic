class FieldMap extends DrawBase{
	
	List<PuyoPuyo> puyo = new ArrayList<PuyoPuyo>();

	Field field;
	
	int fieldX = 400;
	int fieldY = fieldX * 2;

	FieldMap( int fx, int fy ){
		size = fieldX / 6.0;
		x = fx;
		y = fy;
		field = new Field( fieldX, fieldY );
		puyo.add( new PuyoPuyo( 0, 2, 3, size ) );
		puyo.add( new PuyoPuyo( 1, 4, 1, size ) );
		puyo.add( new PuyoPuyo( 2, 4, 1, size ) );
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
}