function ave = exp3(~)
I1 = imread('leaves.png');
I1= rgb2gray(I1);
I1=im2double(I1);
pkg load image
I1=imresize(I1,[256,256]);
I2= imread('canoe.png');
I2 = rgb2gray(I2);
I2=imresize(I2,[256,256]);
I2=im2double(I2);
subplot(2, 3, 1);imshow(I1);title(' image I1');
subplot(2, 3, 2);imshow(I2);title('image I2');
I3=imadd(I1,I2);
subplot(2, 3, 3);imshow(I3);title('Addition of image I+I1');
I4=imabsdiff(I1,I2);
subplot(2, 3, 4);imshow(I4);title('Subtraction of image I1-I2');
M(1:100,1:256)=0;
M(101:150,1:256)=1;
M(151:256,1:256)=0;
M=im2double(M);
I5=I1*M;
I6=uint8(I5);
subplot(2, 3, 5);imshow(I6);title('Masked Image I');
saveas(gcf,"outputs/exp3.png")
ave=0;
end
