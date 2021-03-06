class Neuron {

  Link [] link;
  float value;
  float [] pos;
  float diameter = 30;
  int nLinks;

  Neuron(int N)
  {
    nLinks = N;
    value = 0;
    link = new Link[nLinks];
    
  }

  Neuron(float pos_x, float pos_y) {
    value = 0;
    pos =  new float [2];
    pos[0] = pos_x;
    pos[1] = pos_y;
  }


  float sigmoid(float x) {

    float f_sigmoid = 1/(1-exp(-x));
    return f_sigmoid;
  };

  float sum_all(Link [] links) {

    float result = 0;

    for ( Link v : links) {
      result += v.getValue();
    }

    return result;
  };

  float get_value() {

    return sigmoid(sum_all(link));
  }

  void update() {
    value = get_value();
  }
  
  void linkTo(Neuron[] neuronsIn)
  {
    for(int i = 0; i<nLinks; i++)
    {
        link[i] = new Link(neuronsIn[i]);
    }
  }
  
///////////////////////////////////////////////////
  void draw_neuron(float [] Position) {
    fill(0, 0, 255);
    ellipse(Position[0], Position[1], diameter, diameter);
  }

  void draw_links() {
    for ( Link v : link) {
      stroke(255, 0, 0);
      line(pos[0], pos[1], v.in.pos[0], v.in.pos[1]);
    }
  }
}
