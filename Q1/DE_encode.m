function c = DE_encode(x)
s = sign(x);
x = abs(x);
p = 2 .^ [31:(-1):(-32)]';
c = [s; round(floor(x./p) - 2 * floor(x./(2*p)))];
end