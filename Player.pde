class Player{

	Button button[] = new Button[4];
	DrawBase fieldMap;

	int hoge = 0;

	int fieldArray[][] = {
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0 }
	};
	
	Player(){
		fieldMap = new FieldMap( 100, 100 );
		button[0] = new Button( 'a', 50, 700 );
		button[1] = new Button( 's', 50, 820 );
		button[2] = new Button( 'd', 650, 700 );
		button[3] = new Button( 's', 650, 820 );
	}

	void draw(){
		fieldMap.draw();
		process();
	}

	void process(){
		for( Button b : button ){
			b.draw();
			if( !b.isSendSignal ) continue;
		}
	}
}