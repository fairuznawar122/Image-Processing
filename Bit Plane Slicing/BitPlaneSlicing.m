clear all, close all, clc
% load and display image
I=imread('henry_cavil.png');
% Grayscale
R = rgb2gray(I);
figure, imshow(R);
% Size
[row , col] = size(R);
depth = log2(col)
k = 0 : depth-1
X = 2.^k
% Bitwise Seperation
S = zeros(row,col);
figure;

for l = 1:depth
    for i = 1:1:row
        for j = 1:1:col
               mask= X(l);
               S(i,j)=bitand(R(i,j),mask);
        end
    end
subplot(2,4,l), imshow(S);
end 
