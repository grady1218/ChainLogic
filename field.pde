class Field extends DrawBase{

	Field( int xSize, int ySize ){
		x = xSize;
		y = ySize;
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

	}

}