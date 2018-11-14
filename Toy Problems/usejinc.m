% Test Script to use the "jinc" function

range = -4.9:0.04:4.9;

[x y] = meshgrid(range,range);

z = jinc(sqrt(x.^2 + y.^2));  % 2D JINC (blurring function in CT and radial MRI)
% z = sinc(x).* sinc(y);  % 2D SINC (blurring function in most MRI)
% z = sqrt(x.^2 + y.^2)<1.5; % 2D PILLBOX (blurring function in optics)

mesh(x,y,z);
xlabel('x');
ylabel('y');
zlabel('f(x,y)');

%% QUESTION
%
%  Implement other 2D functions that you'd like to visualize.
%