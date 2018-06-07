function derivative = calculate_sigmoidal_derivative(x, lambda = 1)
  derivative = lambda/2 * (1 - calculate_sigmoidal(x,lambda) .^ 2);
end;