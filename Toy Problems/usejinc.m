% Test Script to use the "jinc" function

range = -4.9:0.2:4.9;

[x y] = meshgrid(range,range);

% z = jinc(sqrt(x.^2 + y.^2));
z = sinc(x).* sinc(y);

mesh(x,y,z)