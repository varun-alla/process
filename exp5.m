function ave = exp5(~)
myimage=imread("canoe.png");
if(size(myimage,3)==3)
myimage =rgb2gray(myimage);
end
pkg load image;
y=imhist(myimage);
newimage= histeq(myimage);
figure;
subplot(2,2,1);imshow(myimage); title('Original image');
subplot(2,2,2);imshow(y); title('Histogram of original image');
subplot(2,2,2);imshow(newimage); title('Histogram equalized image');

% histogram calculation and equalization without using standard function
close all;
clear all;
data=imread("canoe.png");
if(size(data,3)==3)
data=rgb2gray(data);
end
subplot(2,2,1);imshow(data); title('Original image');
[rows cols]=size(data)
myhist=zeros(1,256);
% Calculation of histogram
for i=1:rows
for j=1:cols
m=double(data(i,j));
myhist(m+1)=myhist(m+1)+1;
end
end
subplot(2,2,2);bar(myhist); title('Histogram of original image');
sum=0;
%Cumulative values
for i=0:255
sum=sum+myhist(i+1);
sum_of_hist(i+1)=sum;
end
area=rows*cols;
%Dm=input('Enter no. of gray levels in output image: ');
Dm=256;
for i=1:rows
for j=1:cols
n=double(data(i,j));
data(i,j)=sum_of_hist(n+1)*Dm/area;
end
end
%Calculation of histogram for equalized image
for i=1:rows
for j=1:cols
m=double(data(i,j));
myhist(m+1)=myhist(m+1)+1;
end
end
subplot(2,2,3);bar(myhist);title('Equalized Histogram');
subplot(2,2,4);imshow(data); title('Image after histogram equalization');
saveas(gcf,"outputs/exp5.png")
ave =0
end
