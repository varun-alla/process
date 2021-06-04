function ave = exp2(~)
 T = 100;
 a = 50;
 b = 150;
  img=imread("leaves.png");
  %img = rgb2gray(img);
  figure,subplot(2,3,1),imshow(img),title("input image");
  %Finding negative of image
  [row,col]=size(img);
  negimg=2^8-1-img;
  subplot(2,3,2),imshow(negimg);
  title("Negative image")

  % *%****************************To flip image horizontally**********************
   imag = imread("leaves.png");
     imag = rgb2gray(imag);
   Ala=size(imag)
  horflip=fliplr(img);

  subplot(2,3,3),imshow(horflip);
  title("FlippedImage");
  %*******************Thresholding to create binary image*****************
  %T=input("Enter threshold value between 0 to 255:");
  imag = imread("leaves.png");
     imag = rgb2gray(imag);
  [m,n]=size(imag);

  for i=1:m
  for j=1:n
    if(img(i,j)>T)
    y(i,j)=255;
    else
    y(i,j)=0;
    end
  end
  end
  subplot(2,3,4),imshow(y);
  title("threshold image")
  xlabel("T=100")
  %******************Contrast stretching of image***************************
  display(num2str(col))
  img = imread("leaves.png");
     %img = rgb2gray(img);
  [row,col,h]=size(img)
  for i=1:row
    for j=1:col
        if(img(i,j)<=a)
        newimg(i,j)=img(i,j);
        end
        if (img(i,j)>a&&img(i,j)<=b)
        newimg(i,j)=2*img(i,j);
        end
        if(img(i,j)>b)
        newimg(i,j)=img(i,j);
        end
    end
   end
  subplot(2,3,5)
  imshow(newimg);
  title("Contrast Stretching")
  xlabel("a=50 b = 150")
  ave =0;
saveas(gcf,"outputs/exp2.png")

end