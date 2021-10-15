clear all; clc; close all;
in1= imread('input1.jpg');
in2= imread('input2.jpg');

[row1,col1,ch1]=size(in1);
[row2,col2,ch2]=size(in2);

output = uint8(zeros(row1, col1, ch1));

indices = 1:floor(col1/6):col1+col1/6;
indices(7)= indices(7)-1


for i=1:6
    if mod(i,2)==0
        sindex = indices(i);
        eindex = indices(i+1);
        output(:,sindex:eindex,:) = in2(:,sindex:eindex,:);
    
    else 
        sindex = indices(i);
        eindex = indices(i+1);
        output(:,sindex:eindex,:) = in1(:,sindex:eindex,:);
    end
end

figure;imshow(in1);
figure;imshow(in2);
figure;imshow(output);