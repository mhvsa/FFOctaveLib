function [acc,positive,negative] = testing(net, x, y)
  negative = 0;
  positive = 0;
  for i = 1:size(x,2)
    
 %   netResult = sim(net,x(:,i));
%    [max_values,indiecies] = max(netResult);
    
    netResult = round(sim(net,x(:,i)));
    d = zeros(10,1);
    d(y(:,i)+1,:) = 1;
   
    if(d == netResult)
      positive = positive + 1;
    else
      negative = negative + 1;
    end
  end
  
  acc = positive/length(y);
  
end