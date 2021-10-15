I=imread('cameraman.png');
% figure;
imshow(I);
% a= rgb2gray(I)
[row,col]=size(I);
X=zeros(1,256);
for i=1:row
    for j=1:col
              temp=I(i,j);
              X(temp)=X(temp)+1;   
    end
end
figure;
bar(X);
title('Hist plot')
xlabel('Pixel values')
ylabel('Frequency')

