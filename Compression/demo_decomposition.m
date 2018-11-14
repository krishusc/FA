% Wavelet Decomposition Demo
%
% by Krishna Nayak, 19 Nov 2013


%% Image

im = imread('testimages512/35.gif','gif');
im = double(im);

W = Wavelet;

figure(1); 
imshow(im,[0 256]); 
title('original');
truesize;


%% Wavelet Decomposition

tx = W*im;
figure(2); 
imshowWAV(tx); 
title('wavelet');
truesize;

%% Wavelet Reconstruction (no loss)

im2 = W'*tx;
figure(3); imshow(abs(im2),[0 256]); title ('recon');
truesize;

%% Wavelet Decomposition in the presence of Additive Noise

figure(4);
for n=1:50;
    imn = im+randn(512)*n;  % Added noise
    txn = W*imn;            % Wavelet Tx
    subplot(1,2,1); imshow(imn,[0 256]); 
    subplot(1,2,2); imshowWAV(txn);
    title(sprintf('noise level: %d',n));
    drawnow;
end