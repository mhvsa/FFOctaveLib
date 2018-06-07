function new_network = weight_correction(network, err, input,alpha = 0.5)
  
  new_network = network;
  
  out_from_hidden_layer = calculate_sigmoidal(calculate_net(network.hidden_layer,input));
  out_from_hidden_layer = [out_from_hidden_layer;1];
  
  x = out_from_hidden_layer';
  x = x * alpha;

  m = err.output_layer .* x;

  new_network.output_layer = network.output_layer + m;
  
  x = input' .* alpha;
  m = err.hidden_layer .* x;

  new_network.hidden_layer = network.hidden_layer + alpha * m;
  
end