% Input Image
Input = imread('input.jpg');
Input = rgb2gray(Input);
I = imnoise(Input, 'gaussian', 0.001); 
Output=zeros(size(I));
figure;
imshow(I);

% Input Sigma
userInput = 'Enter Sigma: ';
sigma = input(userInput);

% Window size
v = 3;
window = -v : v
x= repmat(window,7,1);
y = x';
m = 2*v;
n = 2*v;

% Kernal
power = -(x.^2+y.^2)/(2*sigma*sigma);
K= exp(power)/(2*pi*sigma*sigma);

% Padding the Margin
[row,col]=size(I);
X= zeros(row+m,col+n);
X(v+1:row+v,v+1:col+v)= I;


[row,col]=size(X);

% Output Image Generation
for i = 1:row-m
    for j =1:col-n
        T = X(i:i+m,j:j+n).*K;
        Output(i,j)=sum(T(:));
    end
end

Output = uint8(Output);
figure;
imshow(Output);

