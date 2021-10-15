I=imread('cameraman.png');
figure;
imshow(I);
[row,col]=size(I);
X=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        X(i,j)=255-I(i,j);
    end
end
figure;
imshow(X);
figure;
plot(I,X,'.-k');