function ave = exp11(~)

rgb = imread('leaves.png');
subplot(2,3,1),imshow(rgb),title('lena RGB image');
rgb=im2double(rgb);
r=rgb( : , : , 1);
g=rgb( : , : , 2);
b=rgb( : , : , 3);
num=0.5*((r-g)+(r-b));
den=sqrt((r-g).^2+(r-b).*(g-b));
theta=acos(num./(den+eps));
h=theta;
h(b>g)=2*pi-h(b>g);
h=h/(2*pi);
num=min(min(r,g),b);
den=r+g+b;
den(den==0)=eps;
s=1-3.*num./den;
subplot(2,3,2),imshow(s),title('lenasaturationn image');
h(s==0)=0;
subplot(2,3,3),imshow(h),title('lena hue image');
i=(r+g+b)/3;
subplot(2,3,4),imshow(i),title('lena intensity image');
hsi=cat(3,h,s,i);
subplot(2,3,5),imshow(hsi),title('lenahsi image');
saveas(gcf,"outputs/exp11.png")
ave =0;
end