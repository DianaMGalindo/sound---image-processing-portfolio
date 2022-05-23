import controlP5.*;
import processing.sound.*;

//Sound File instances/ sounds to be used 
SoundFile sampleCore;
SoundFile sampleWoodbox;
SoundFile samplePiano;

//Waveform Objects to Visualize the wave of each sound
Waveform waveformCore;
Waveform waveformWoodbox;
Waveform waveformPiano;

//variables to sample the sound wave / print the name of the wave
int samples = 100;
String soundID;

//Variables to setup the Amplitude slider 

ControlP5 amplitudeSlider;



void setup() {
  size(800, 600);  


  //Setting up 3 audio sample files 
  sampleCore = new SoundFile(this, "Salsa_el_Preso_main.wav");
  sampleCore.loop();

  sampleWoodbox = new SoundFile(this, "Wooden_Box.wav");
  sampleWoodbox.loop();

  samplePiano = new SoundFile(this, "Salsa_piano.wav");
  samplePiano.loop();

  // Extracting the waveform data from the audio samples
  // All of them preserve the same amount of samples

  waveformCore = new Waveform(this, samples);
  waveformCore.input(sampleCore);

  waveformWoodbox = new Waveform(this, samples);
  waveformWoodbox.input(sampleWoodbox);

  waveformPiano = new Waveform(this, samples);
  waveformPiano.input(samplePiano);

  //Initialize Amplitude and Frequency 
  sampleCore.amp(0.5);
  sampleCore.rate(1); 

  sampleWoodbox.amp(0.5);
  sampleWoodbox.rate(1);

  samplePiano.amp(0.3);
  samplePiano.rate(1);

  //Setting up Amplitude slider
  amplitudeSlider = new ControlP5(this);
 
} //close setup
 float mapAmp = 0.5;

void draw() {
  waveformCore.analyze();
  waveformWoodbox.analyze();
  waveformPiano.analyze();
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  //Drawing all the points from the Core waveform 
  pushMatrix();
  translate(50, 50);
  beginShape();
  for (int i = 0; i < samples; i++)
  {
    float angle = map(i, 0, samples, 0, TWO_PI);
    float x = (cos(angle) * waveformCore.data[i]) *500;
    float y = (sin(angle) * waveformCore.data[i]) *500 ;
    vertex( x, y
    //// x cosine
    //  map(i, 0, samples, 0, width), 
      
    //// y sine  
    //  map(waveformCore.data[i], -1, 1, 0, height)
      );
  }
  endShape();
  popMatrix();

  // Drawing all the points from the waveform 
  beginShape();
  for (int i = 0; i < samples; i++)
  {
    vertex(
      map(i, 0, samples, 0, width), 
      map(waveformWoodbox.data[i], -1, 1, 0, height)
      );
  }
  endShape();

  //Drawing all the points from the waveform 

  beginShape();
  for (int i = 0; i < samples; i++)
  {
    vertex(
      map(i, 0, samples, 0, width), 
      map(waveformPiano.data[i], -1, 1, 0, height)
      );
  }
  endShape();

  salsaCoreSample();
  salsaWoodbox();
  salsaPiano();

} //close draw


//Sample #1 Core Sample
void salsaCoreSample() {
  addSlider();
  soundID = "core"; 

  //Manipulate Amplitude with Mouse (potentially with slider) 
  //sampleCore.amp(map(mouseY, 0, height, 1, 0));
};


//Sample #2 Woodbox sample
void salsaWoodbox() {
  soundID = "Woodbox";

  //Manipulate Amplitude with Mouse (potentially with slider) 
  sampleWoodbox.amp(map(mouseY, 0, height, 1, 0));
};

//Sample #3  Piano Sample
void salsaPiano() {
  soundID = "Piano";
  //Manipulate Amplitude with Mouse (potentially with slider) 
  samplePiano.amp(map(mouseY, 0, height, 1, 0));
};


// Setting up the sliders 
//void mapAmplitude(int value) {
//   sampleCore.amp(value);
//}

void addSlider() {
  amplitudeSlider.addSlider("mapAmp")
    .setPosition(100, 100)
    .setRange(0, 1)
    .setSize(200, 25)
    .setValue(0.5);
}


void keyPressed() {

  if (key =='1') {
    soundID = "core";
    salsaCoreSample();
    sampleCore.loop();
  } 
  if (key == '2') {
    soundID = "Woodbox";
    salsaWoodbox();
    sampleWoodbox.loop();
  } 
  if (key == '3') {
    soundID = "Piano";
    samplePiano.loop();
    salsaPiano();
  } 
  if (key == 'q') {
    sampleCore.stop();
  } 
  if (key == 'w') {
    sampleWoodbox.stop();
  }
  if (key == 'e') {
    samplePiano.stop();
  }

  println(soundID);
}// close keyPressed 
