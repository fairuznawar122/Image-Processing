% Fairuz Nawar - 170104122
clear all, close all, clc

% Histogram Equilization
input = imread('cameraman.png');

[row,col]=size(input);
n = double(row*col);
output = uint8(zeros(row,col));

% Input Image Histogram
histogram = zeros(1,256);
for i=1:row
    for j=1:col
        temp = input(i,j)+1;
        histogram(temp) = histogram(temp)+1;   
    end
end

% Plot
figure;
subplot(2,2,3), bar(histogram);
title('Histogram plot')
xlabel('Pixel')
ylabel('Frequency')

% PDF,CDF Calculation 
pdf = zeros(1,256);
pdf = double(histogram/n);
sum(pdf)

cdf = zeros(1,256);
cdf(1,1)=pdf(1,1);
for c=2:256
    cdf(1,c)= cdf(1,c-1)+pdf(1,c);
end
cdf(end,end);
cdf =255*cdf;



% Output Image Genetation
for i=1:row
    for j=1:col
        temp = input(i,j)+1;
        output(i,j) = cdf(1,temp);
    end
end

h = zeros(1,256);
for i=1:row
    for j=1:col
        t = output(i,j)+1;
        h(t) = h(t)+1;   
    end
end
% Plotting Input and Output Image
subplot(2,2,1),imshow(input);
title('Original Image')
subplot(2,2,2),imshow(output);
title('Equilized Image')
% Plot
subplot(2,2,4), bar(h);
title('Equilized Histogram plot')
xlabel('Pixel')
ylabel('Frequency')

%------------------ Histogram Specification -------------------

r = imread('s1.png');
reference = rgb2gray(r);
[rrow,rcol]=size(reference);
rn= double(row*col);
% Histogram Of Refrernce Image
histogramRef = zeros(1,256);
for i=1:row
    for j=1:col
        temp2 = reference(i,j)+1;
        histogramRef(temp2) = histogramRef(temp2)+1;   
    end
end
% PDF, CDF Of Refrernce Image
pdfRef = zeros(1,256);
pdfRef = histogramRef/rn;
sum(pdfRef)

cdfRef = zeros(1,256);
cdfRef(1,1)=pdfRef(1,1);
for c=2:256
    cdfRef(1,c)= cdfRef(1,c-1)+pdfRef(1,c);
end
cdfRef(end,end);
cdfRef = 255*cdfRef;

% Reference Image and Histogram Plot
figure;
subplot(2,2,1),imshow(reference);
title('Reference Image')
subplot(2,2,3),bar(histogramRef);
title('Reference Image Histogram')

% Mapping
M = zeros(256,1,'uint8');
res = zeros(1,256,'double');

for index=1:256
    for val=1:256
        res = abs(cdfRef-cdf(index));
        [x,y]=min(res);
        M(index)= y-1;
    end
end

result = zeros(row,col,'uint8');

% Result Image Generation
for i=1:row
    for j=1:col
        result(i,j)=M(double(input(i,j))+1);
    end
end

% Histogram Of Result
histogramResult = zeros(1,256);
for i=1:row
    for j=1:col
        temp4 = result(i,j)+1;
        histogramResult(temp4) = histogramResult(temp4)+1;   
    end
end

subplot(2,2,2),imshow(result);
title('Result Image');
subplot(2,2,4),bar(histogramResult);
title('Result Image Histogram');
