function [ score ] = compare_entropy( image)
%Compares input image using ssd over multiple head images and returns best
%result
sigma = 5;
[r,c] = size(image);
i1 = entropy(imread('Compare_Heads/bl.JPG'));
i2 = entropy(imread('Compare_Heads/blal.JPG'));
i3 = entropy(imread('Compare_Heads/blas.JPG'));
i4 = entropy(imread('Compare_Heads/brs.JPG'));
i5 = entropy(imread('Compare_Heads/bs.JPG'));
i6 = entropy(imread('Compare_Heads/gl.JPG'));
i7 = entropy(imread('Compare_Heads/gs.JPG'));
compare_array = [i1,i2,i3,i4,i5,i6,i7];
score_array =[1000,1000,1000,1000,1000,1000,1000];
[dnm,l] =size(score_array);
for x=1:l
    score_array(x) = entropy(image) - compare_array(x);
end
score = min(score_array);
end
