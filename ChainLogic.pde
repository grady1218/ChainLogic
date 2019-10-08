DrawBase field[] = new DrawBase[5];

void setup() {
	size( 700, 1200, JAVA2D );
	field[0] = new FieldMap( 100, 100 );
	field[1] = new Button( 'a', 50, 700 );
	field[2] = new Button( 's', 50, 820 );
	field[3] = new Button( 'd', 650, 700 );
	field[4] = new Button( 's', 650, 820 );
}

void draw() {
	for( int c = 0; c < field.length; c++ ){
		field[c].draw();
	}
}