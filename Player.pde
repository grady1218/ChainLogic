class Player{

	Button button[] = new Button[4];
	DrawBase fieldMap;
	
	Player(){
		fieldMap = new FieldMap( 100, 100 );
		button[0] = new Button( 's', 650, 820 );
		button[1] = new Button( 'a', 50, 700 );
		button[2] = new Button( 's', 50, 820 );
		button[3] = new Button( 'd', 650, 700 );
	}

	void draw(){
		process();
		fieldMap.draw();
		for( Button b : button ){
			b.draw();
		}
	}

	void process(){
		for( Button b : button ){
			char signal = b.getSignal();
			if( signal == 'N' ) return;
			println( signal );

		}
	}
}