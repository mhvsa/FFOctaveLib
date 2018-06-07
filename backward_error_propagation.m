function [err,v,y] = backward_error_propagation(network,X,Y,lambda = 1)
  
  input = X;
  labels = Y;
  
  hidden_layer_net = calculate_net(network.hidden_layer, input);
  v = [arrayfun(@(x) calculate_sigmoidal(x,lambda), hidden_layer_net);1]; % create good input to a second layer
%  v = [calculate_sigmoidal(hidden_layer_net); ones(1, size(hidden_layer_net,2))];
  output_layer_net = calculate_net(network.output_layer,v);
  y = calculate_out(network,input);
  
  der = arrayfun(@(x) calculate_sigmoidal_derivative(x,lambda), output_layer_net);
  %der = calculate_sigmoidal_derivative(output_layer_net,lambda);
  err.output_layer = der .* (labels - y);
  
  % PROBABLY WRONG
  %err.output_layer = sum((der .* (labels - y))')';
  %END
  
  d = err.output_layer;
  err.hidden_layer = [];
  
  der = arrayfun(@(x) calculate_sigmoidal_derivative(x,lambda), hidden_layer_net);
  %der = calculate_sigmoidal_derivative(hidden_layer_net,lambda);
  
  number_of_neurons = size(network.hidden_layer);
  %A = sum(network.output_layer);
  %A = A(:,1:length(A)-1)';
  %ex = der .* A .* d'
  
  % find easier, more elegant solution - propbably is possible to vectorize it
  for i = 1:number_of_neurons
    err.hidden_layer = [err.hidden_layer;der(i) .* sum(network.output_layer(:,i) .* d)];
  end
   
end