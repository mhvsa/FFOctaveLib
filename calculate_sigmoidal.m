function y = calculate_sigmoidal(x, lambda = 1)
  y = (2./(1 + exp(-lambda*x))) - 1;
 end