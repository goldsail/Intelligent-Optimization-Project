function x_mid2 = DE_crossover(x_prev, x_mid1, params)

N = size(x_mid1, 1);

x_mid2 = zeros(N, size(x_mid1, 2));

for i = 1:N
   
   x1 = x_prev(i, :);
   x2 = x_mid1(i, :);
   
   c1 = DE_encode(x1);
   c2 = DE_encode(x2);
   
   R = double(rand(size(c1)) < params.CR);
   
   c_new = c1 .* (1 - R) + c2 .* R;
   
   x_new = DE_decode(c_new);
   x_mid2(i, :) = x_new;
    
end

end