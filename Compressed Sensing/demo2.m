% plots for talk at ohrid, june 2011
% demo 2

seedn = 11;
rand('state',seedn);

n = 128;

% sparse signal
x = [[1:5]/5 zeros(1,n-5)];
x = x(randperm(n));

% part (2) - uniform and random undersampling
% uniform undersampling, standard aliasing
disp('** Uniform undersampling of the signal')
disp('Please hit any key to continue')
pause
dim = 2;
X = fftc(x,dim);
Xu = zeros(1,n);
Xu(1:4:n) = X(1:4:n); % uniformly take 1/4 of samples
xu = ifftc(Xu,dim)*4;

figure(1);
stem(abs(xu));
grid on; xlabel('n'); ylabel('xu');
axis([0 128 -0.25 1.25]);


% random undersampling, incoherent aliasing
disp('** Random undersampling of the signal, note incoherent aliasing')
disp('Please hit any key to continue')
pause

Xr = zeros(1,n);
prm = randperm(n);
Xr(prm(1:32)) = X(prm(1:32)); % randomly take 1/4 of samples
xr = ifftc(Xr,dim)*4;

figure(2);
stem(real(xr));
hold on, 
stem(imag(xr),'g');
grid on; xlabel('n'); ylabel('xr');
axis([0 128 -0.25 1.25]);

% part (3) - reconstruction from randomly sampled freq domain data
% projection over convex sets algorithm
disp('** Signal reconstruction from randomly sampled frequency domain data')
disp('Please hit any key to continue')
pause

% Y are samples of the Fourier transform that we have acquired (randomly undersampled)
Y = Xr;

% Xhat is Fourier transform of the signal estimate xhat
% initialize with the acquired data
Xhat = Y;

lambda = 0.01;

for iter = 1:100
    xhat = ifftc(Xhat,dim);
    xhat = SoftThresh(xhat,lambda);  % soft-thresholding
    Xhat = fftc(xhat,dim);
    Xhat = Xhat.*(Y==0) + Y;         % data consistency

   figure(3), 
   stem(real(xhat))
   hold on, 
   stem(imag(xhat),'g');
   hold off
   grid on; xlabel('n'); ylabel('xhat');
   axis([0 128 -0.25 1.25]);
   drawnow, pause(0.1);

end

figure(3);
 stem(real(xhat))
 hold on, 
 stem(imag(xhat),'g');
grid on; xlabel('n'); ylabel('xhat');
axis([0 128 -0.25 1.25]);


% create plots of max errors vs iteration number for different lambdas
disp('** Max errors vs iteration for different lambdas')
disp('Please hit any key to continue')
pause


errs = [];
lambda = [0.01 0.05 0.1];

for lam = [lambda]

    Xhat = Y;
    err = [];

    for iter = 1:200
        xhat = ifftc(Xhat,dim);
        xhat = SoftThresh(xhat,lam); % soft-thresholding
        Xhat = fftc(xhat,dim);
        Xhat = Xhat.*(Y==0) + Y;     % data consistency

        err = [err max(abs(xhat-x))];
    end
    errs = [errs; err];

end

figure(4);
iter = [1:length(errs)];
plot(iter,errs(1,:),iter,errs(2,:),iter,errs(3,:));
grid on; xlabel('iter'); ylabel('errs');
legend('lam01','lam05','lam1');
