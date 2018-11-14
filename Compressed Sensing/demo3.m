% plots for talk at ohrid, june 2011
% demo 3

% ----------------------------------
% Part II Sparsity of medical Imaging

% display the brain image
disp('Display the brain image')
disp('Please hit any key to continue'), pause

load brain.mat
figure(9), imshow(abs(im),[])
title('Beautiful Axial T2 Weighted Brain image');

% compute the wavelet transform

disp('Compute and display the Wavelet transform')
disp('Please hit any key to continue'), pause

W = Wavelet;
im_W = W*im;
figure(10), imshowWAV(im_W);
title('The wavelet transform of the beautiful brain');

% Threshold the wavelet coefficients retaining only 
% the largest 10% of the coefficients. Plot the reconstructed image.

disp('Reconstruction from largest 10% wavelet coefficients')
disp('Please hit any key to continue'), pause

m = sort(abs(im_W(:)),'descend');
ndx = floor(length(m)*10/100);
thresh = m(ndx);
im_W_th = im_W .* (abs(im_W) > thresh);
im_denoise = W'*im_W_th;

figure, imshow(abs(cat(2,im,im_denoise, (im-im_denoise)*10)),[0,1]);
title('Reconstruction from 10% largest coefficients');

% Repeat the experiment with a threshold of 2.5

disp('description')
disp('Reconstruction from largest 2.5% wavelet coefficients'), pause

m = sort(abs(im_W(:)),'descend');
ndx = floor(length(m)*2.5/100);
thresh = m(ndx);
im_W_th = im_W .* (abs(im_W) > thresh);
im_denoise = W'*im_W_th;

figure, imshow(abs(cat(2,im,im_denoise, (im-im_denoise)*10)),[0,1]);
title('Reconstruction from largest 2.5% wavelet coefficients');


