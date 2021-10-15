% Fairuz Nawar - 170104122
clear all, close all, clc

i = imread('s.jpg');
input = rgb2gray(i);
[row,col]=size(input);
input=double(input);
R = uint8(ones(row,col));
A = min(min(input));
B = max(max(input));
D = double(B-A);
M = double(255);
mul = double(M/D);
t1 = double(zeros(row,col));
t1 = double(input-A);
t2 = double(t1*mul);
R = t2+A;

% Plot
figure;
subplot(2,2,1),imshow(uint8(input));
title('Original Image')
subplot(2,2,2),imshow(uint8(R));
title('Stretched Image')

% Histogram
histogramIn = zeros(1,256);
histogramOut = zeros(1,256);
for i=1:row
    for j=1:col
        tx = uint8(input(i,j))+1;
        histogramIn(tx) = histogramIn(tx)+1;
        ty = uint8(R(i,j)+1);
        histogramOut(ty) = histogramOut(ty)+1;
    end
end

subplot(2,2,3), 
bar(histogramIn);
title('Histogram plot Input')
xlabel('Pixel')
ylabel('Frequency')
subplot(2,2,4), bar(histogramOut);
title('Histogram plot Output')
xlabel('Pixel')
ylabel('Frequency')