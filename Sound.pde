class Sound {
  Minim minim;
  AudioOutput out;

  String[] scale = {
    "C4", "G4"
  }; //"E4", "F4", "G4", "A5", "B5", "C5"};

  Sound() {
    minim = new Minim(this);
    out = minim.getLineOut();
  }
  
  void shotSound(){
    out.playNote(0.0, 0.1, new SineInstrument(Frequency.ofPitch(scale[int(random(scale.length))]).asHz(), out)); 
  }
  
  void thrustSound(){
    out.playNote(0.0, 0.1, new SineInstrument(random(100, 110), out));
  }
}

//////////////////////////////////////////////////////////////////////
class SineInstrument implements Instrument {
  Oscil wave;
  Line ampEnv;
  AudioOutput out;


  SineInstrument(float frequency, AudioOutput out_) {
    out = out_;
    wave = new Oscil(frequency, 0, Waves.SAW);
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude);
  }

  void noteOn( float duration) {
    ampEnv.activate(duration, 0.5f, 0);
    wave.patch(out);
  }

  void noteOff() {
    wave.unpatch(out);
  }
}

