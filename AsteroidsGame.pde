Stars[] sky = new Stars[555];
Spaceship fly;
Asteroid[] asteroids = new Asteroid[16]; 

public void setup() {
    size(800, 800);
    fly = new Spaceship();
    for (int i = 0; i < sky.length; i++) {
        sky[i] = new Stars();
    }
    for (int i = 0; i < asteroids.length; i++) {
        asteroids[i] = new Asteroid(); 
    }
}

public void draw() {
    background(0);

    // Show stars
    for (int i = 0; i < sky.length; i++) {
        sky[i].show();
    }

    // Show and move asteroids
    for (int i = 0; i < asteroids.length; i++) {
        if (asteroids[i] != null) { // Check if asteroid exists (not removed)
            asteroids[i].show();
            asteroids[i].move();

            // Check for collision with spaceship
            float d = dist((float)fly.myCenterX, (float)fly.myCenterY, 
                           (float)asteroids[i].getCenterX(), (float)asteroids[i].getCenterY());
            if (d < 20) { 
                asteroids[i] = null; 
            }
        }
    }

    
    fly.move();
    fly.show();
}

public void keyPressed() {
    if (key == 'W' || key == 'w') {
        fly.setAccelerating(true);
    }
    if (key == 'S' || key == 's') {
        fly.setDecelerating(true);
    }
    if (key == 'A' || key == 'a') {
        fly.setTurningLeft(true);
    }
    if (key == 'D' || key == 'd') {
        fly.setTurningRight(true);
    }
    if (key == 'H' || key == 'h') {
        fly.hyperspace();
    }
}

public void keyReleased() {
    if (key == 'W' || key == 'w') {
        fly.setAccelerating(false);
    }
    if (key == 'S' || key == 's') {
        fly.setDecelerating(false);
    }
    if (key == 'A' || key == 'a') {
        fly.setTurningLeft(false);
    }
    if (key == 'D' || key == 'd') {
        fly.setTurningRight(false);
    }
}
