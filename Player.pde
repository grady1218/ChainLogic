class Player{

	Button button[] = new Button[4];
	Puyo puyoData[][] = new Puyo[6][14];
	FieldMap fieldMap;
	
	Player(){
		fieldMap = new FieldMap( 100, 100 );
		button[0] = new Button( kc.getKey( "left" ), 50, 700 );
		button[1] = new Button( kc.getKey( "down" ), 50, 820 );
		button[2] = new Button( kc.getKey( "right" ), 650, 700 );
		button[3] = new Button( kc.getKey( "down" ), 650, 820 );
	}

	void draw(){
		fieldMap.draw();
		process();
	}

	void process(){
		for( Button b : button ){
			b.draw();
			if( !b.isSendSignal ) continue;
			checkSignal( b.getSignal() );
		}
	}

	void checkSignal( char s ){
		int x = 0;
		int y = 0;
		if( s == kc.getKey( "left" ) ){
			x--;
		}
		if( s == kc.getKey( "right" ) ){
			x++;
		}
		if( s == kc.getKey( "down" ) ){
			y++;
		}
		fieldMap.movePuyo( x, y );
	}

}