function x = DE_decode(c)
s = c(1, :);
p = 2 .^ [31:(-1):(-32)]';
x = c(2:end, :)' * p;
x = s .* x';
end