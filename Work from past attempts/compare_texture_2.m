function [ score ] = compare_texture( image,num )
%Compares input image using ssd over multiple head images and returns best
%result
sigma = 5;
image = rangefilt(rgb2gray(image));
[r,c] = size(image);
window = image(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i1 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/bl.JPG')),[r,c]));
i1 = i1(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i2 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/blal.JPG')),[r,c]));
i2 = i2(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i3 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/blas.JPG')),[r,c]));
i3 = i3(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i4 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/brs.JPG')),[r,c]));
i4 = i4(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i5 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/bs.JPG')),[r,c]));
i5 = i5(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i6 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/gl.JPG')),[r,c]));
i6 = i6(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));
i7 = rangefilt(imresize(rgb2gray(imread('Compare_Heads/gs.JPG')),[r,c]));
i7 = i7(int16((r/2)-(r/5)):int16((r/2)+(r/5)),int16((c/2)-(c/5)):int16((c/2)+(c/5)));

compare_array = [i1,i2,i3,i4,i5,i6,i7];
score_array =[1000,1000,1000,1000,1000,1000,1000];
[dnm,l] =size(score_array);
for x=1:l
    score_array(x) = abs(nnz(window)-nnz(compare_array(x)));
end
if num==1
    score = min(score_array);
else
    score = trimmean(score_array,50);
end
end

