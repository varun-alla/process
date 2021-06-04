function ave = exp6(~)
pkg load image;
x =imresize(imread('cameraman.tif'),[255,255]);
subplot(3,3,1); imshow(x); title('Orignial Image');
y=imrotate(x,45,'bilinear','crop');
subplot(3,3,2); imshow(y); title('Image rotated by 45 degree');
y=imrotate(x,90,'bilinear','crop');
subplot(3,3,3); imshow(y); title('Image rotated by 90 degree');
y=imrotate(x,-45,'bilinear','crop');
subplot(3,3,4); imshow(y); title('Image rotated by -45 degree');
tform = maketform('affine',[1,0,0; .5,1,0; 0,0,1]);
y = imtransform(x,tform);
subplot(3,3,5); imshow(x); title('Orignial Image');
subplot(3,3,6); imshow(y); title('Shear in X direction');
tform = maketform('affine',[1 ,0.5, 0; 0, 1, 0; 0, 0, 1]);
y = imtransform(x,tform);
subplot(3,3,7); imshow(y); title('Shear in Y direction');
tform = maketform('affine',[1 ,0.5, 0; 0.5, 1 ,0; 0, 0 ,1]);
y = imtransform(x,tform);
subplot(3,3,8); imshow(y); title('Shear in X-Y direction');
saveas(gcf,"outputs/exp6.png")
ave=0
end