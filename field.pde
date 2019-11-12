class Field extends DrawBase{

	Puyo[][] puyoData;

	Field( int xSize, int ySize, Puyo[][] p ){
		x = xSize;
		y = ySize;
		puyoData = p;
	}

	@Override
	void draw(){
		strokeWeight( 10 );
		stroke( #7777FF );

		background( #AADDEE );
		fill( #777777 );
		rect( 0, 0, x, y );
	
		strokeWeight( 1 );
		stroke( #000000 );

		drawPuyo();

	}

	void drawPuyo(){
		for( int ax = 0; ax < puyoData.length; ax++ ){
			for( int ay = 0; ay < puyoData[0].length; ay++ ){
				if( puyoData[ax][ay] != null ){
					puyoData[ax][ay].draw();
				}
			}
		}
	}

}