function ave = exp15(~)
%Read and display color image in MATLAB
I1=imread('leaves.png');%Reading Image file
figure
subplot(2,3,1)
imshow(I1) % to display images
title("Imshow output")
%converting color image into gray
%imfinfo('leaves.png') % returns a structure whose fields contain information about an
%image in a graphics file.
I = imread('leaves.png');
J = rgb2gray(I);
subplot(2,3,2), imshow(I),title("RGB IMAGE"), subplot(2,3,3), imshow(J),title("gray Image");
%writing gray image into disc
%converting gray scale image into binary
z=imread('A.tif');
pkg load image;
z1=im2bw(z);
subplot(2,3,4),imshow(z1),title("binary image");
%accessing indexed image
imfinfo('forest.tif');
[ax,map]=imread('forest.tif');
%converting image from indexed to gray
I=ind2gray(ax,map);
subplot(2,3,5)
imshow(ax,map);
title("Indexed image");
subplot(2,3,6);
imshow(I);
title("indexed to gray");
saveas(gcf,"outputs/exp1.png")
ave = 3;
end