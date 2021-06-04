function ave = exp10(~)

A=imread('cameraman.tif');
figure;
subplot(2,1,1)
imshow(A);
pkg load image
BW = edge(A,'prewitt');
subplot(2,1,2)
subplot(2,3,1); imshow(BW);title('prewitt mask');
BW = edge(A,'canny');
subplot(2,3,2); imshow(BW);title('canny mask');
BW = edge(A,'sobel');
subplot(2,3,3); imshow(BW);title('sobel mask');
BW = edge(A,'roberts');
subplot(2,3,4); imshow(BW);title('roberts mask');
BW = edge(A,'log');
subplot(2,3,5); imshow(BW);title('log ');
BW = edge(A,'canny');
subplot(2,3,6); imshow(BW);title('zerocorss');
saveas(gcf,"outputs/exp10_1.png")
% to demonstrate various point and edge detections using convolution in spatial domain
data=imread("totem.png");
figure
subplot(3,3,1)
imshow(data)
title("input")
M=[-1 0 -1; 0 4 0; -1 0 -1;] % Default mask
outimage=conv2(double(data),double(M));
subplot(3,3,2)
imshow(outimage);
title("default mask");
M=[-1 -1 -1;-1 8 -1;-1 -1 -1]; % Mask for point detection
outimage=conv2(double(data),double(M));
subplot(3,3,3)
imshow(outimage);
title("Mask for point detection")
M=[-1 -1 -1; 2 2 2; -1 -1 -1]; % Mask for horizontal edges
outimage=conv2(double(data),double(M));
subplot(3,3,4)
imshow(outimage);
title("Mask for horizontal edges")
M=[-1 2 -1; -1 2 -1; -1 2 -1]; % Mask for vertical edges
outimage=conv2(double(data),double(M));
subplot(3,3,5)
imshow(outimage);
title("Mask for vertical edges")
M=[-1 -1 2; -1 2 -1; 2 -1 -1]; % Mask for 45 degree diagonal line
outimage=conv2(double(data),double(M));
subplot(3,3,6)
imshow(outimage);
title("Mask for 45 degree diagonal line")
M=[2 -1 -1;-1 2 -1; -1 -1 2]; % Mask for -45 degree diagonal line
outimage=conv2(double(data),double(M));
subplot(3,3,7)
imshow(outimage);
title("Mask for -45 degree diagonal line")
M=[-1 -1 -1;-1 8 -1;-1 -1 -1];
outimage=conv2(double(data),double(M));
subplot(3,3,8)
imshow(outimage);
title("Mask for rectangle")
saveas(gcf,"outputs/exp10_2.png")
ave=0;
end
