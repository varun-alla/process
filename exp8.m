function ave = exp8(~)
%Define spatial filter masks
L1=[1 1 1;1 1 1;1 1 1];
L2=[0 1 0;1 2 1;0 1 0];
L3=[1 2 1;2 4 2;1 2 1];
H1=[-1 -1 -1;-1 9 -1;-1 -1 -1];
H2=[0 -1 0;-1 5 -1;-0 -1 0];
H3=[1 -2 1;-2 5 -2;1 -2 1];
% Read the test image and display it
A=imread('A.tif');
subplot(3,3,1);
imshow(A); title('Original Image');
L1 = L1/sum(L1);
filt_image= conv2(double(A),double(L1));
subplot(3,3,2);
imshow(filt_image,[]);
title('LPF');
L2 = L2/sum(L2);
filt_image= conv2(double(A),double(L2));
subplot(3,3,3);
imshow(filt_image,[]);
title('LPF1');
L3 = L3/sum(L3);
filt_image= conv2(double(A),double(L3));
subplot(3,3,4);
imshow(filt_image,[]);
title('LPF2');
filt_image= conv2(double(A),H1);
subplot(3,3,5);
imshow(filt_image,[]);
title('Filtered image with mask H1');
filt_image= conv2(double(A),H2);
subplot(3,3,6);
imshow(filt_image,[]);
title('HPF1');
subplot(3,3,7);
imshow(A); title('Original Image');
% The command fspecial() is used to create mask
% The command imfilter() is used to apply the gaussian filter mask to the image
% Create a Gaussian low pass filter of size 3
gaussmask = fspecial('gaussian',3);
filtimg = imfilter(A,gaussmask);
subplot(3,3,8);
imshow(filtimg,[]),title('Output of Gaussian filter 3 X 3');
% Generate a lowpass filter of size 7 X 7
% The command conv2 is used to apply the filter
% This is another way of using the filter
avgfilt = [ 1 1 1 1 1 1 1;
1 1 1 1 1 1 1;
1 1 1 1 1 1 1;
1 1 1 1 1 1 1;
1 1 1 1 1 1 1;
1 1 1 1 1 1 1;
1 1 1 1 1 1 1];
avgfiltmask = avgfilt/sum(avgfilt);
convimage= conv2(double(A),double(avgfiltmask));
subplot(3,3,9);
imshow(convimage,[]);
title('Average filter with conv2()');
saveas(gcf,"outputs/exp8.png")
ave=0;
end