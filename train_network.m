function [trained_network, E_history] = train_network(network, X,Y, max_epocs = 500,alpha=0.05,E_MIN = 1e-3,lambda=1, E_history = [],verbose=5)
  trained_network = network;
  
  E = calculate_error(trained_network,X,Y,lambda);
  printf('Epocs %u/%u, E = %f\n',0,max_epocs,E);
  fflush(stdout);
      
  for i = 1:max_epocs
    before_network = trained_network;
    for j = 1:size(Y,2);
      x = X(:,j);
      y = Y(:,j);
      err = backward_error_propagation(trained_network,x,y,lambda);
      trained_network = weight_correction(trained_network,err,x,alpha);
    end
    
    E = calculate_error(trained_network,X,Y,lambda);
    
    if(mod(i,verbose) == 0)
      printf('Epocs %u/%u, E = %f\n',i,max_epocs,E);
      fflush(stdout);
    end
    E_history = [E_history E];
    network = trained_network;
    if(E < E_MIN)
      return;
    end

  end
end
