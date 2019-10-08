class Field extends DrawBase{

	Field( float fx, float fy ){
		x = fx;
		y = fy;
	}

	@Override
	void draw(){
		strokeWeight( 10 );
		stroke( #7777FF );

		background( 255 );
		fill( #777777 );
		rect( x, y, width - ( x * 2 ), height - ( y * 2 ) );
	
		strokeWeight( 1 );
		stroke( #000000 );

	}

}