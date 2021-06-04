function arv = exp14(~)
N=8;

y = zeros(N,N);
T = zeros(N*N,N*N);
for k = 0:N-1
y(k+1,:) = cos((2*(0:N-1)+1)*pi*k/(2*N));
end
y(1,:) = y(1,:)/sqrt(N);
y(2:N,:) = y(2:N,:) * sqrt(2/N);
figure;
subplot(2,3,1)
imagesc(y)
title('DCT')

y = zeros(N,N);
T = zeros(N*N,N*N);
for k = 0:N-1
y(k+1,:) = sin(((0:N-1)+1)*pi*(k+1)/(N+1));
end
y = y*sqrt(2/(N+1));
subplot(2,3,2)
imagesc(y)
title('DST')

y = zeros(N,N);
T = zeros(N*N,N*N);
for k = 0:N-1
y(k+1,:) = cos((0:N-1)*2*pi*k/N) + sin((0:N-1)*2*pi*k/N);
end
y = y*sqrt(1/N);
subplot(2,3,3)
imagesc(y)
title('Harley')

y = zeros(N,N);
T = zeros(N*N,N*N);
y = zeros(N,N);
T = zeros(N*N,N*N);
sq2 = sqrt(2);
y = [1 1 1 1 1 1 1 1; 1 1 1 1 -1 -1 -1 -1;...
sq2 sq2 -sq2 -sq2 0 0 0 0; 0 0 0 0 sq2 sq2 -sq2 -sq2;...
2 -2 0 0 0 0 0 0; 0 0 2 -2 0 0 0 0;...
0 0 0 0 2 -2 0 0; 0 0 0 0 0 0 2 -2];
y = y/sqrt(8);
subplot(2,3,4)
imagesc(y)
title('Haar')

y = zeros(N,N);
T = zeros(N*N,N*N);
y = [1 1; 1 -1];
y = y/sqrt(2);
n = 2;
while n < N
n = 2*n;
y = [y y; y -y];
y = y/sqrt(2);
end
subplot(2,3,5)
imagesc(y)
title('Hadamard')

y = zeros(N,N);
T = zeros(N*N,N*N);
a8 = sqrt(16/21);
b8 = sqrt(5/21);
s4 = [1 1 1 1; 3/sqrt(5) 1/sqrt(5) -1/sqrt(5) -3/sqrt(5);1 -1 -1 1; 1/sqrt(5) -3/sqrt(5) 3/sqrt(5) -1/sqrt(5)];
s4 = s4/2;
h1 = [1 0 0 0 1 0 0 0];
h2 = [a8 b8 0 0 -a8 b8 0 0];
h3 = [0 0 1 0 0 0 1 0];
h4 = [0 0 0 1 0 0 0 1];
h5 = [0 1 0 0 0 -1 0 0];
h6 = [-b8 a8 0 0 b8 a8 0 0];
h7 = [0 0 1 0 0 0 -1 0];
h8 = [0 0 0 1 0 0 0 -1];
y = [h1;h2;h3;h4;h5;h6;h7;h8]*[s4 zeros(4,4);...
zeros(4,4) s4]/sqrt(2);
subplot(2,3,6)
imagesc(y)
title('Slant')
saveas(gcf,"outputs/exp14.png")
arv=0;
end