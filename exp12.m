function ave = exp12(~)

x=imread('cameraman.tif');
figure
subplot(1,3,1);imshow(x);title('original image ')
pkg load signal
f=dct2(x);
subplot(1,3,2);imshow(f*0.01);title('DCT of the whole image')
pkg load signal
ff=idct2(f);
subplot(1,3,3);imshow(ff*0.004);title('recovered image using inverse DCT')



c=imread('leaves.png');
c=rgb2gray(c);
cd=double(c);
c0=mod(floor(cd),2);
saveas(gcf,"outputs/exp12_1.png")
figure;
subplot(2,2,1);
imshow(c0);
title('Bit plane 0');
c1=mod(floor(cd/2^1),2);
subplot(2,2,2);
imshow(c1);
title('Bit plane 1');
c2=mod(floor(cd/2^2),2);
subplot(2,2,3);
imshow(c2);
 title('Bit plane 2');
c3=mod(floor(cd/2^3),2);
subplot(2,2,4);
imshow(c3);
title('Bit plane 3');
c4=mod(floor(cd/2^4),2);
saveas(gcf,"outputs/exp12_2.png")
figure
subplot(2,2,1);
imshow(c4);
title('Bit plane 4');
c5=mod(floor(cd/2^5),2);
subplot(2,2,2);
imshow(c5);
title('Bit plane 5');
c6=mod(floor(cd/2^6),2);
subplot(2,2,3);
imshow(c6);
title('Bit plane 6');
c7=mod(floor(cd/2^7),2);
subplot(2,2,4);
imshow(c7);
title('Bit plane 7');
saveas(gcf,"outputs/exp12_3.png")
ave =0;
end
