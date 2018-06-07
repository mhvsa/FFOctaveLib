function network = create_network(input_size, hidden_size, output_size)
   network.hidden_layer = -1 + 2 * rand(hidden_size, input_size + 1);
   network.output_layer = -1 + 2 * rand(output_size, hidden_size + 1);
end