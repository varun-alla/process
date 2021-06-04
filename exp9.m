function ave = exp9(~)
myimg = imread("totem.png");
if(size(myimg,3)==3)
myimg=rgb2gray(myimg);
end
pkg load image
myimg = imresize(myimg,[256 256]);
myimg=double(myimg);
subplot(2,2,1);
imshow(myimg,[]),title('Original Image');
[M,N] = size(myimg); % Find size

% Find FFT of the image
myfftimage = fft2(myimg);
subplot(2,2,2);
imshow(myfftimage,[]),title('FFT Image');
% Define cut off frequency
low = 30;
band1 = 20;
band2 = 50;
%Define Filter Mask
mylowpassmask = ones(M,N);
mybandpassmask = ones(M,N);
% Generate values for ifilter pass mask
for u = 1:M
for v = 1:N
tmp = ((u-(M/2))^2 +(v-(N/2))^2)^0.5;
if tmp> low
mylowpassmask(u,v) = 0;
end
if tmp> band2 || tmp< band1;
mybandpassmask(u,v) = 0;
end
end
end
% Apply the filter H to the FFT of the Image
resimage1 = myfftimage.*mylowpassmask;
resimage3 = myfftimage.*mybandpassmask;
% Apply the Inverse FFT to the filtered image
% Display the low pass filtered image
r1 = abs(ifft2(resimage1));
subplot(2,2,3);
imshow(r1,[]),title('Low Pass filtered image');
% Display the band pass filtered image
r3 = abs(ifft2(resimage3));
subplot(2,2,4);
imshow(r3,[]),title('Band Pass filtered image');
saveas(gcf,"outputs/exp9_1.png")
figure;
subplot(2,1,1);imshow(mylowpassmask);
subplot(2,1,2);imshow(mybandpassmask);
saveas(gcf,"outputs/exp9_2.png")
ave=0;
end
