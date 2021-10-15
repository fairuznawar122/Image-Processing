I=imread('cameraman.png');
figure;
imshow(I);
I=im2double(I);
[row,col]=size(I);
X=zeros(row,col);
c=2;
for i=1:row
    for j=1:col
        X(i,j)=c*log(1+I(i,j));
    end
end
% c=2
% X=log(1+I).*c;
figure;
imshow(X);
figure;
plot(I,X,'.r');
%%%%%%%%%%%%%%%%%%%%%Inverse LOG
c=2;
for i=1:row
    for j=1:col
        power= (I(i,j)/c);
        X(i,j)=exp(power)-1;
    end
end
% X=(exp(I).^(1/c))-1;
figure;
imshow(X);
figure;
plot(I,X,'.r');

