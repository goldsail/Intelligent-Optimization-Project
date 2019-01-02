function y = TSP(x, p)

assert(size(x, 2) == size(p, 1));
N = size(x, 2);

x = round(x);
assert(min(sort(x) == 1:N));

q = [p(x, :); p(x(1), :)];

t1 = q(1:(end-1), :);
t2 = q(2:end, :);

y = trace(sqrt((t1 - t2) * (t1 - t2)'));

end