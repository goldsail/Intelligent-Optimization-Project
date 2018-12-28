function x_mid1 = DE_mutation(x_prev, params)

N = size(x_prev, 1);

x_mid1 = zeros(N, size(x_prev, 2));

for i = 1:N
    s = datasample(1:N, 2, 'Replace', false);
    x_mid1(i, :) = x_prev(i, :) + ...
        params.F * (x_prev(s(1), :) - x_prev(s(2), :));
end

end