% Demonstration - Transform Sparsity!
%
% test sparsity in (left) object, (middle) fourier, and (right) wavelet domains
%
% by Krishna Nayak, 19 Nov 2013

%% Import Data
im = imread('testimages512/9.gif','gif');
im = double(im);

%% Generat Wavelet and Fourier transform representations
W = Wavelet;
imf = fft2c(im);
imw = W*im;

%% Sort coefficients in descending order
%  makes it easier to extract highest XX%
[m,idx] =  sort(abs(im(:)),'descend');
[m,idxf] = sort(abs(imf(:)),'descend');
[m,idxw] = sort(abs(imw(:)),'descend');

%% Loop from 0.5 to 10% of coefficients
tmp  = zeros(512);
tmpf = zeros(512);
tmpw = zeros(512);
for perc=0.5:0.5:10;
    
    n = round(length(idx(:))*perc/100);
	tmp(idx(1:n)) = im(idx(1:n));
	tmpf(idxf(1:n)) = imf(idxf(1:n));
    tmpw(idxw(1:n)) = imw(idxw(1:n));
	figure(100);
    imshow(cat(2,abs(tmp),abs(ifft2c(tmpf)),abs(W'*tmpw)),[]);
	title(sprintf('%.1f percent coefficients',perc));
    truesize;
	if (perc<2) pause; end
end