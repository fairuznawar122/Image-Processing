clear all; clc;
% Input
In1 = imread('f1.png');
In2 = imread('f2.png');
In3 = imread('f3.png');
In4 = imread('f4.png');
In5 = imread('f5.png'); 
% Grayscale
Img1 = rgb2gray(In1);
Img2 = rgb2gray(In2);
Img3 = rgb2gray(In3);
Img4 = rgb2gray(In4);
Img5 = rgb2gray(In5);
% Binary
I1 = imbinarize(Img1);
I2 = imbinarize(Img2);
I3 = imbinarize(Img3);
I4 = imbinarize(Img4);
I5 = imbinarize(Img5);

% Number Output
count = ones(100, 100);
NumPos =  [27 85];

% Disk Structuring Element
DB = strel('disk',50);
DS = strel('disk',5);


% Image 1
% Erosion
E1 = imerode(I1,DB); 
% Dialation
D1 = imdilate(E1,DB); 
FN1 = I1-D1;
% Removing Noise
F1 = imerode(FN1,DS);
F1 = imerode(F1,DS);
% Output Number
[x1 s1] = bwlabel(F1);
Num = int2str(s1);
Box1 = insertText(count,NumPos,Num,'AnchorPoint','LeftBottom','BoxColor','w','FontSize',40);


% Image 2
% Erosion
E2 = imerode(I2,DB); 
% Dialation
D2 = imdilate(E2,DB); 
FN2 = I2-D2;
% Removing Noise
F2 = imerode(FN2,DS);
F2 = imerode(F2,DS);
% Output Number
[x2 s2] = bwlabel(F2);
Num = int2str(s2);
Box2 = insertText(count,NumPos,Num,'AnchorPoint','LeftBottom','BoxColor','w','FontSize',40);

% Image 3
% Erosion
E3 = imerode(I3,DB); 
% Dialation
D3 = imdilate(E3, DB);
FN3 = I3-D3;
% Removing Noise
F3 = imerode(FN3,DS);
F3 = imerode(F3,DS);
% Output Number
[x3 s3] = bwlabel(F3);
Num = int2str(s3);
Box3 = insertText(count,NumPos,Num,'AnchorPoint','LeftBottom','BoxColor','w','FontSize',40);

% Image 4
% Erosion
E4 = imerode(I4,DB); 
% Dialation
D4 = imdilate(E4,DB);
FN4 = I4 - D4; 
% Removing Noise
F4 = imerode(FN4,DS);
F4 = imerode(F4,DS);
[x4 s4] = bwlabel(F4);
Num = int2str(s4);
Box4 = insertText(count,NumPos,Num,'AnchorPoint','LeftBottom','BoxColor','w','FontSize',40);


% Image 5
% Erosion
E5 = imerode(I5,DB); 
% Dialation
D5 = imdilate(E5,DB); 
FN5 = I5-D5;
% Removing Noise
F5 = imerode(FN5,DS);
F5 = imerode(F5,DS);
[l5 s5] = bwlabel(F5);
Num = int2str(s5);
Box5 = insertText(count,NumPos,Num,'AnchorPoint','LeftBottom','BoxColor','w','FontSize',40);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subplots
figure;
% IMG 1
subplot(6,6,1), imshow(In1);
title('Original');
subplot(6,6,2), imshow(I1);
title('Binary Image');
subplot(6,6,3), imshow(D1);
title('Palm');
subplot(6,6,4), imshow(FN1);
title('Fingers Noisy');
subplot(6,6,5), imshow(F1);
title('Fingers Noiseless');
subplot(6,6,6), imshow(Box1);
title('Number Of Finger');


% IMG 2
subplot(6,6,7), imshow(In2);
title('Original');
subplot(6,6,8), imshow(I2);
title('Binary Image');
subplot(6,6,9), imshow(D2);
title('Palm');
subplot(6,6,10), imshow(FN2);
title('Fingers Noisy');
subplot(6,6,11), imshow(F2);
title('Fingers Noiseless');
subplot(6,6,12), imshow(Box2);
title('Number Of Finger');


% IMG 3
subplot(6,6,13), imshow(In3);
title('Original');
subplot(6,6,14), imshow(I3);
title('Binary Image');
subplot(6,6,15), imshow(D3);
title('Palm');
subplot(6,6,16), imshow(FN3);
title('Fingers Noisy');
subplot(6,6,17), imshow(F3);
title('Fingers Noiseless');
subplot(6,6,18), imshow(Box3);
title('Number Of Finger');


% IMG 4
subplot(6,6,19), imshow(In4);
title('Original');
subplot(6,6,20), imshow(I4);
title('Binary Image');
subplot(6,6,21), imshow(D4);
title('Palm');
subplot(6,6,22), imshow(FN4);
title('Fingers Noisy');
subplot(6,6,23), imshow(F4);
title('Fingers Noiseless');
subplot(6,6,24), imshow(Box4);
title('Number Of Finger');


% IMG 5
subplot(6,6,25), imshow(In5);
title('Original');
subplot(6,6,26), imshow(I5);
title('Binary Image');
subplot(6,6,27), imshow(D5);
title('Palm');
subplot(6,6,28), imshow(FN5);
title('Fingers Noisy');
subplot(6,6,29), imshow(F5);
title('Fingers Noiseless');
subplot(6,6,30), imshow(Box5);
title('Number Of Finger');


