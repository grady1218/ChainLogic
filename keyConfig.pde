class KeyConfig{

	HashMap<String,Character> keyConfig = new HashMap<String,Character>();

	KeyConfig( char left, char down, char right ){
		setLeftKey( left );
		setDownKey( down );
		setRightKey( right );
	}

	void setLeftKey( char left ){
		keyConfig.put( "left", left );
	}
	void setDownKey( char down ){
		keyConfig.put( "down", down );
	}
	void setRightKey( char right ){
		keyConfig.put( "right", right );
	}

	char getKey( String k ){
		return keyConfig.get( k );
	}

}