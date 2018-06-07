function [acc,positive,negative] = test_network(network, X,Y, lambda=1)
  negative = 0;
  positive = 0;
  for i = 1:size(Y,2)
    not_rounded_out = calculate_out(network,X(:,i),lambda);
    out = round(not_rounded_out);
    y = Y(:,i);
    if(out == y)
      positive = positive + 1;
    else
      negative = negative + 1;
    end
  end
  acc = positive/size(Y,2);
end
