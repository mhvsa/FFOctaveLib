function [y, y1] = calculate_out(network, input, lambda = 1)
  y1 = calculate_sigmoidal(calculate_net(network.hidden_layer, input));
  y1 = [y1;ones(1,size(y1,2))];
  y = calculate_sigmoidal(calculate_net(network.output_layer,y1));
end