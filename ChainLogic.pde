Player player;

void setup() {
	size( 700, 1200, JAVA2D );
	player = new Player();
}


void draw() {
	player.draw();
}