
import java.util.HashMap;
import java.util.Map;

KeyConfig kc;
Player player;

void setup(){
	size( 700, 1200, JAVA2D );
	kc = new KeyConfig( 'a', 's', 'd' );
	player = new Player();
}


void draw(){
	player.process();
	player.draw();
}