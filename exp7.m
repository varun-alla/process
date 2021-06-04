function ave = exp7(~)
pkg load image
A = imread('cameraman.tif');
A=im2double(A);
subplot(3,3,1); imshow(A);title('original');
% Add salt & pepper noise
pkg load image;
B = imnoise(A,"salt & pepper", 0.02);
subplot(3,3,2); imshow(B);title('with salt and pepper');
% Remove Salt & pepper noise by median filters
K = medfilt2(B);
subplot(3,3,3); imshow(K); title('s&p removed with median');
% Remove salt & pepper noise by Wiener filter
L = wiener2(B,[5 5]);
subplot(3,3,4); imshow(L); title('s&p removed with wiener');
% Add gaussian noise
M = imnoise(A,'gaussian',0,0.005);
subplot(3,3,5); imshow(M); title('with gaussian');
% Remove Gaussian noise by Wiener filter
L1 = wiener2(M,[5 5]);
subplot(3,3,6); imshow(L1);title('gaussian removed with wiener');
K1 = medfilt2(M);
subplot(3,3,7); imshow(K1); title('gaussian removed with median');
%**********b****************
I = imread('A.tif');
%I = I(60+[1:256],222+[1:256],:);% crop the image figure;
LEN = 31; THETA = 11;
 PSF = fspecial('motion',LEN,THETA); %
Blurred = imfilter(I,PSF,'circular','conv');
wnr1 = deconvwnr(Blurred,PSF);
%Display various results
saveas(gcf,"outputs/exp7_1.png")
figure
subplot(1,3,1);imshow(I); title('Original Image');
subplot(1,3,2);imshow(Blurred);title('Blurred Image');
subplot(1,3,3);imshow(wnr1);title('Restored Image');
%***************c******************
I = imread('A.tif');
%I = I(50+[1:256],2+[1:256],:);
PSF = fspecial('gaussian',5,5);
Blurred = imfilter(I,PSF,'symmetric','conv');
V = .002;
BlurredNoisy = imnoise(Blurred,'gaussian',0,V);
luc1 = deconvwnr (BlurredNoisy,PSF,5);
%Display various results
saveas(gcf,"outputs/exp7_2_1.png")
figure
subplot(2,2,1);imshow(I);title('Original Image');
subplot(2,2,2);imshow(Blurred);title('Blurred Image');
subplot(2,2,3);imshow(BlurredNoisy);title('Blurred and Noisy Image');
subplot(2,2,4);imshow(luc1);title('Restored image');
%***************
saveas(gcf,"outputs/exp7_2_2.png")
figure
title("7exp 3rd prog did not execute use material images")
saveas(gcf,"outputs/exp7_3.png")
I = imread('A.tif');
I=mat2gray(double(I));
PSF=fspecial('gaussian',3,10);
v=.0001;
J0=imnoise(imfilter(I,PSF),'gaussian',0,V);
WT = zeros(size(I));
WT(5:end-4,5:end-4) = 1;
J1= deconvwnr (J0,PSF,10);
J2 = deconvwnr (J0,PSF,20,sqrt(v));
J3 = deconvwnr (J0,PSF,20,sqrt(v),WT);
subplot(141);imshow(J0);title('gaussian low pass filtered image');
subplot(142);imshow(J1);title('LR deconvolution 10 iterations');
subplot(143);imshow(J2);title('LR deconvolution 20 iterations');
subplot(144);imshow(J3);title('Weighed LR deconvolution ');

ave =0;
end