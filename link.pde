class Link
{
  Neuron In; 
  float Weight;
  float Value;

  Link(Neuron In)
  {
    Weight = 0;
    generateLink();
  }

  float getValue(float Weight){
    Value = Neuron.Value * Weight; 
  }
  
  void generateLink()
  {
    Value = getValue(Weight);
    
  }
}
