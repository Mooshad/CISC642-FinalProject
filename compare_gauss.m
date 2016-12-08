function [ score ] = compare_gauss( image,num )
%Compares input image using ssd over multiple head images and returns best
%result
image = imgaussfilt(rgb2gray(image),5);
[r,c] = size(image);
i = imresize(imread('Compare_Heads/gaus2d.jpg'),[r,c]);
se = offsetstrel('ball',5,5);
image = imerode(image,se);
image = imerode(image,se);
ci = imcomplement(i);
if num ==1
    score = sum(sum((ci - image).^2));
else
    score = sum(sum((i - image).^2));
end

end
