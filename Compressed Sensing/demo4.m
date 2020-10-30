% Demo 4 by Miki Lustig
% minor tweaks by Krishna Nayak

% Display the mask and the PDF
disp('Display the undersampling mask and the PDF')
disp('Please hit any key to continue'), pause

figure; imshow(cat(2,mask_vardens,pdf_vardens),[]);
title('The sampling pattern and the pdf')

% Compute the 2D Fourier transform of the image. Multiply with the mask, divide
% by the PDF. Compute the inverse Fourier transform and display the result.

disp('Linear reconstruction from x3 subsampled data')
disp('Please hit any key to continue'), pause

M = fft2c(im);
M_us = (M.*mask_vardens)./pdf_vardens;
im_us = ifft2c(M_us);
figure, imshow(abs(cat(2,im,im_us, (im_us-im)*10)),[0,1])
title('Linear reconstruction from x3 subsampled data');

% Implement the POCS algorithm for 2D images. Use lambda value from the
% thresholding experiment. Use 20 iterations. 

disp('POCS compressed sensing iterations and reconstruction')
disp('Please hit any key to continue'), pause

DATA = fft2c(im).*mask_vardens;
im_cs = ifft2c(DATA./pdf_vardens); % initial value
figure;
for iter=1:15
	im_cs = W'*(SoftThresh(W*im_cs,0.025));
	im_cs = ifft2c(fft2c(im_cs).*(1-mask_vardens) + DATA);
	imshow(abs(im_cs),[]),
        title(sprintf('Iteration number %d',iter));
        drawnow;
end

figure, imshow(abs(cat(2,im,im_us,im_cs)),[0,1]);
title('Reconstruction from x3 subsampled data');
