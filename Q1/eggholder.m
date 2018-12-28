function y = eggholder(x)


x1 = x(1);
x2 = x(2) + 47;

y = - x2 * sin(sqrt(abs(x1/2 + x2))) - x1 * sin(sqrt(abs(x1 - x2)));


end