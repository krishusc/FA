%load brain
load lena512
im=lena512;
W = Wavelet;

im_W = W*im;
IM = fft2c(im);
[m,idx] = sort(abs(im_W(:)),'descend');
[m,idx2] = sort(abs(IM(:)),'descend');

tmp=zeros(512);
tmp2 = zeros(512);

for n=1:150:round(length(idx(:))*0.03)
	tmp(idx(1:n)) = im_W(idx(1:n));
	tmp2(idx2(1:n)) = IM(idx2(1:n));
	figure(100), imshow(cat(2,abs(W'*tmp),abs(ifft2c(tmp2))),[])
	title(sprintf('%f percent coefficients',(n/length(idx(:))*100)));
	drawnow;
	
end

