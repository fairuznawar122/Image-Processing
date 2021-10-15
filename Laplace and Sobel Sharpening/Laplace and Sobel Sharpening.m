clear all; clc; close all;

Img = imread('Image1.jpg');
Img = im2double(Img);

% Padding
[row, col] = size(Img);
I = zeros(row+2, col+2);
I(2:row+1, 2:col+1) = Img;

% Laplace Filter
L = zeros(row, col);
LaplaceFilter = [ 0 -1  0  ;
                 -1  4 -1  ;
                  0 -1  0 ];
              
for i=2:row+1
    for j=2:col+1
        temp = I(i-1:i+1,j-1:j+1).*LaplaceFilter;
        L(i-1,j-1)= sum(sum(temp));
    end
end

LEI = (Img+L);

% Sobel Filter
sobelx = zeros(row, col);
sobely = zeros(row, col);
threshold = 0.1;

sx = [ -1 0 1 ;
       -2 0 2 ;
       -1 0 1 ];
sy = [ -1 -2 -1 ;
        0  0  0 ;
        1  2  1 ];
    
for i=2:row+1
    for j=2:col+1
        t1 = I(i-1:i+1,j-1:j+1).*sx;
        sobelx(i-1, j-1) = sum(sum(t1));
        t2 = I(i-1:i+1,j-1:j+1).*sy;
        sobely(i-1, j-1) = sum(sum(t2));
    end
end

SI= sqrt(sobelx.*sobelx + sobely.*sobely);

for i=1:row
    for j=1:col
        if SI(i, j)>= threshold
            SI(i, j) = SI(i, j);
        else
            SI(i, j) = 0;
        end
    end
end

% Average Filter

AI = zeros(row, col);
I = zeros(row+4, col+4);
% Padding (Pixels 3-322 include Original)
I(3:row+2, 3:col+2) = SI;

v = [1/25, 1/25, 1/25, 1/25, 1/25];
Mask=zeros(5,5);
for i=1:5
    Mask(i,:)=v;
end


for i = 3:(row+2)
    for j = 3:(col+2)
        T = I(i-2:i+2, j-2:j+2).*Mask;
        AI(i-2, j-2) = sum(T(:));
    end
end

% Product
P = LEI.*AI;

% Sum 
S = Img + P;

% Power Law Transform
c = 1;
gamma = 0.5;
Power = c*Img.^gamma;

figure;
subplot(2, 4, 1); imshow(Img); title('(a) Input');
subplot(2, 4, 2); imshow(L, []); title('(b) Laplace Filtered');
subplot(2, 4, 3); imshow(LEI); title('(c) Laplace Enhanced Image');
subplot(2, 4, 4); imshow(SI); title('(d) Sobel Filtered Image');
subplot(2, 4, 5); imshow(AI); title('(e) Average Filtered');
subplot(2, 4, 6); imshow(P); title('(f) Product c, e');
subplot(2, 4, 7); imshow(S); title('(g) Sum a, f');
subplot(2, 4, 8); imshow(Power); title('(h) Power Law Transform');
