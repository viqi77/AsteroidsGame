class Stars {
    private int myX, myY, myColor;

    public Stars() {
        myX = (int)(Math.random() * 800);
        myY = (int)(Math.random() * 800);
        myColor = color((int)(Math.random() * 250), (int)(Math.random() * 250), (int)(Math.random() * 250));
    }

    public void show() {
        fill(myColor);
        ellipse(myX, myY, 3, 3);
    }
}
