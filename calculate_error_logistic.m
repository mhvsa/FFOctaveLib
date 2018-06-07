function E = calculate_error_logistic(network, X,Y, lambda = 1) 
  
  m = size(Y,2);
  out = calculate_out(network, X,lambda);
  A = Y .* log(out);
  log(out)
  B = (1 - Y) .* log(1 - out);
  C = sum(A + B);
  E = -1/m * sum(C);

end;
  
