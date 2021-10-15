in=imread('cameraman.png');
[row,col] = size(in);
% Zoom in
for i= 1:2*row
    for j=1:2*col
        p=i-floor(i/2);
        q=j-floor(j/2);
        out(i,j)=in(p,q);
    end
end
figure;
imshow(out);
% Zoom out
for i= 1:row/2
    for j=1:col/2
        p=i*2;
        q=j*2;
        out2(i,j)=in(p,q);
    end
end
figure;
imshow(out2);