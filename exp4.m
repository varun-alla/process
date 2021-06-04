function ave = exp4(~)
I1 = imread('cameraman.tif');
pkg load image;
I1=im2double(I1);
I1=imresize(I1,[256,256]);
pkg load image;
I1=im2bw(I1);
I2= imread('leaves.png');
I2 = rgb2gray(I2);
I2=imresize(I2,[256,256]);
I2=im2double(I2);
pkg load image;
I2=im2bw(I2);
subplot(2,3, 1);imshow(I1);title(' image I1');
subplot(2,3, 2);imshow(I2);title('image I2');
%finding negative of image
cimageA= ~I1 ;
subplot(2,3, 3);imshow(cimageA), title('Complement of Image A');
%finding ex-or opertion
xorimage= xor(I1,I2);
subplot(2,3, 4);imshow(xorimage), title('Image A XOR Image B');
%finding OR opertion
orimage= I1|I2;
imshow(orimage), title('Image A OR Image B');
%finding AND operation
orimage= I1 & I2;
subplot(2,3, 5);imshow(orimage), title('Image A AND Image B');
saveas(gcf,"outputs/exp4.png")
ave=0;
end