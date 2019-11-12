class Player{

	Button button[] = new Button[4];
	Puyo puyoData[][] = new Puyo[6][14];
	FieldMap fieldMap;
	
	Player(){
		fieldMap = new FieldMap( 100, 100, puyoData );
		button[0] = new Button( kc.getKey( "left" ), 50, 700 );
		button[1] = new Button( kc.getKey( "down" ), 50, 820 );
		button[2] = new Button( kc.getKey( "right" ), 650, 700 );
		button[3] = new Button( kc.getKey( "down" ), 650, 820 );
	}

	void draw(){
		fieldMap.draw();
		for( Button b : button ){
			b.draw();
		}
	}

	void process(){
		for( Button b : button ){
			b.process();
			if( !b.isSendSignal ) continue;
			checkSignal( b.getSignal() );
		}
		fieldMap.process();
	}

	void checkSignal( char s ){
		
		int x = 0;
		int y = 0;
		int puyoX = fieldMap.puyo[0].x;
		int puyoY = fieldMap.puyo[0].y;
		
		if( s == kc.getKey( "left" ) && !( puyoX == 0 ) ){
			if( puyoData[puyoX-1][puyoY] == null )x--;
		}
		if( s == kc.getKey( "right" ) && !( puyoX == 5 ) ){
			if( puyoData[puyoX+1][puyoY] == null )x++;
		}
		if( s == kc.getKey( "down" ) && !( puyoY == 13 ) ){
			if( puyoData[puyoX][puyoY+1] == null ){
				for( int c = 0; c < 20; c++ ){
					fieldMap.puyo[0].process();
				}
			}else{
				fieldMap.puyo[0].groundingTime += 20;
			}
		}
		fieldMap.movePuyo( x, y );
	}

}