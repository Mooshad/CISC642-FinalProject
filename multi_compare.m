function [ score ] = multi_compare( image,num )
%Compares input image using ssd over multiple head images and returns best
%result
sigma = 5;
image = imgaussfilt(rgb2gray(image),sigma);
[r,c] = size(image);
i1 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/bl.JPG')),[r,c]),sigma);
i2 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/blal.JPG')),[r,c]),sigma);
i3 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/blas.JPG')),[r,c]),sigma);
i4 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/brs.JPG')),[r,c]),sigma);
i5 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/bs.JPG')),[r,c]),sigma);
i6 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/gl.JPG')),[r,c]),sigma);
i7 = imgaussfilt(imresize(rgb2gray(imread('Compare_Heads/gs.JPG')),[r,c]),sigma);
compare_array = [i1,i2,i3,i4,i5,i6,i7];
score_array =[1000,1000,1000,1000,1000,1000,1000];
[dnm,l] =size(score_array);
for x=1:l
    score_array(x) = sum(sum((compare_array(x) - image).^2));
end
if num==1
    score = min(score_array);
else
    score = trimmean(score_array,50);
end
end

