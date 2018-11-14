% Image Compression Demonstration 
% test sparsity in object, fourier, and wavelet domains
%
% by Krishna Nayak, 19 Nov 2013

%% Import Data
im = imread('otherimages/champloo3.jpg','jpg');
im = sum(im,3);
im = im(1:256,1:256);
figure(99); imagesc(im); truesize;
colormap(gray)
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
tmp  = zeros(256);
tmpf = zeros(256);
tmpw = zeros(256);
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