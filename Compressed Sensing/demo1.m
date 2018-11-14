% plots for talk at ohrid, june 2011
% demo 1

% setup rand state and problem parameters
seedn = 11;
randn('state',seedn); rand('state',seedn);

n = 128;

% part (1) - sparse signals
disp('** Generate a sparse signal and corrupt it with Gaussian noise')
disp('Please hit any key to continue'), pause

x = [[1:5]/5 zeros(1,n-5)];
x = x(randperm(n));

figure(1);
stem(x);
grid on; xlabel('sample'); ylabel('x');
axis([0 128 -0.25 1.25]);

y = x + 0.05*randn(1,n);

figure(2);
stem(y);
grid on; xlabel('sample'); ylabel('y');
axis([0 128 -0.25 1.25]);

% l2 denoising
disp('** l2-denoising of the signal')
disp('Please hit any key to continue'), pause

lambda = 0.1;
xl2 = 1/(1+lambda)*y;

figure(3)
stem(xl2);
grid on; xlabel('n'); ylabel('x');
axis([0 128 -0.25 1.25]);

% soft threshold function
disp('** soft threshold function')
disp('Please hit any key to continue'), pause

lambda = 2;
u = [-10:0.01:10];
Su = SoftThresh(u,lambda);

figure(4);
plot(u,Su);
grid on; xlabel('u'); ylabel('Su');
axis([-10 10 -10 10]);

% l1-denoising
disp('** l1-denoising of the signal')
disp('Please hit any key to continue'), pause

lambda = 0.1;
xl1 = SoftThresh(y,lambda);

figure(5);
stem(xl1);
grid on; xlabel('n'); ylabel('x');
axis([0 128 -0.25 1.25]);
