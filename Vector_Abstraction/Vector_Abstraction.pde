//PShape mask;

void setup() {
  size(1000, 1000);
  //noLoop();
  frameRate(5.5);
  //background(#dddddd); 
  //mask = createShape(ELLIPSE, width/2, height/2, 150);
}//closing setup 


void draw() {
  background(#dddddd); 

  //define coordinates of triangle
  int[][] coordinates = {
    {0, 300}, 
    {-430, 125}, 
    {-430, -255}, 
    //triangle 2
    {0, 300}, 
    {-430, -255}, 
    {0, -480}, 
    //triangle3
    {0, 300}, //6
    {0, -480}, //7
    {415, -240} //8
  };

  //define vectors of triangle
  //P1 = (x0, y0), P2 = (x1, y1), P3 = (x2, y2)
  //vector a = P2 - P1
  //vector b = P3 - P1

  int[] vectorA = {coordinates[1][0] - coordinates[0][0], 
    coordinates[1][1] - coordinates[0][1]};
  println(vectorA);

  int[] vectorB = {coordinates[2][0] - coordinates [0][0], 
    coordinates[2][1] - coordinates[0][1]}; 
  println(vectorB);

  int[] vectorC = {coordinates[4][0] - coordinates [3][0], 
    coordinates[4][1] - coordinates[3][1]};

  int[] vectorD = {coordinates[5][0] - coordinates [3][0], 
    coordinates[5][1] - coordinates[3][1]};  

  int[] vectorE = {coordinates[7][0] - coordinates [6][0], 
    coordinates[7][1] - coordinates[6][1]};  

  int[] vectorF = {coordinates[8][0] - coordinates [6][0], 
    coordinates[8][1] - coordinates[6][1]};


  //Triangles outline 
  strokeWeight(1);
  fill(#CC6600);
  pushMatrix();
  translate(500, 500);
  //noFill();
  //stroke(#3211df);
  //triangle(0, 300, -430, 125, -430, -255);
  //stroke(#d92a89);
  //triangle(0, 300, -430, -255, 0, -480);
  //stroke(#e51e1e);
  //triangle(0, 300, 0, -480, 415, -240);


  strokeWeight(10);
  stroke(0);

  //Right half Stems
  line(0, -380, 20, -440);
  line(180, -250, 320, -340);
  line(20, -125, 80, -200);
  line(20, 100, 100, -10);
  line(60, 90, 180, -30);
  line(40, 180, 160, 40);

  //left half Stems
  line (-200, -360, -20, -160);
  line (-100, -120, -40, 0);
  line (-160, -100, -60, 80);
  line (-180, -110, -260, -120);
  line (-380, 0, -300, -20);
  line (-220, 40, -100, 60);


  //Root
  line(-200, 320, -60, 180);
  line(-40, 480, 10, 120);
  line(-120, 450, 50, 100);
  line(-80, 120, 80, 450);
  line(-80, 80, 180, 360);
  line(0, 180, 80, 360);
  line(-20, -20, 20, 450);
  stroke(#dddddd);
  line(-100, 180, 100, 180); //line across root

  //text 
  String p_One = "The Art Directors Club is honored to invite you to a reception and dinner";
  text(p_One, 340, -125, 150, 100);

  String p_Two = "to commemorate\nthe induction\n of new members\ninto its\nHall of Fame";
  text(p_Two, 340, -30, 150, 100);

  String p_Three = "Friday,\nNovember 4, 1983\nThe Pierre\nFifth Avenue\nand 61st Street\nNew York City";
  text(p_Three, 340, 55, 150, 100);
  
  String p_Four = "Cocktails at 7 \nDinner at 8 \nPresreation at 9 \nBlack tie preferred";
  text(p_Four, 340, 150, 150, 100);

  popMatrix();




  pushMatrix();
  translate(500, 800);
  uniformTriangle(vectorA, vectorB, 5);
  uniformTriangle(vectorC, vectorD, 11);
  uniformTriangle(vectorE, vectorF, 8);
  popMatrix();


  pushMatrix();
  //translate(400, 0);
  // uniformTriangle(vectorC, vectorD);  
  popMatrix();
}//close draw function


void uniformTriangle(int[] v1, int[] v2, int amount) { 
  for (int shape = 0; shape < amount; shape++) {
    float rp1 = random(0, 1);
    float rp2 = random(0, 1);
    float inTriangle = rp1 + rp2;
    //println(inTriangle);

    if (inTriangle <=1) {
      float pointx = (rp1 * v1[0]) + (rp2 * v2[0]);
      float pointy = (rp1 * v1[1]) + (rp2 * v2[1]);
      //fill(0);
      //circle(pointx, pointy, 50);
      fill(0);
      noStroke();
      pushMatrix();
      translate(pointx, pointy);
      rotate(random(-PI/10, PI/10));
      triangle(0, 0, 50, 100, -50, 100);
      popMatrix();

      //println(pointx, pointy);
    } else { 
      float pointx = ((1- rp1) * v1[0]) + ((1-rp2) * v2[0]);
      float pointy = ((1-rp1) * v1[1]) + ((1- rp2) * v2[1]);
      noStroke();
      fill(#5c5b59);
      pushMatrix();
      translate(pointx, pointy);
      rotate(random(TWO_PI));
      arc( 0, 0, 100, 100, 0, PI+QUARTER_PI, CHORD);
      popMatrix();
      //println(pointx, pointy);
    }
  }
}; //close uniformTriangle


void keyPressed() {
  redraw();
}
