in=imread('cameraman.png');
[row,col] = size(in);
out=uint8(zeros(row,col));
T=120;
for i=1:row
    for j=1:col
        if in(i,j)>T
            out(i,j)=255;
        else
            out(i,j)=0;
        end
    end
end
