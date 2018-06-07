function E = calculate_error(network, X,Y, lambda = 1)
  out = calculate_out(network, X,lambda);
  E = sum(sum((Y - out) .^ 2));
  E = 0.5 * E;
end;
  
