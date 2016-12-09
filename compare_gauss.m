function [ score ] = compare_gauss( image,num )
%Compares input image using ssd over multiple head images and returns best
%result
image = imgaussfilt(rgb2gray(image),5);
[r,c] = size(image);    
i = imresize(imread('Compare_Heads/gaus2d.jpg'),[r,c]);
l = multithresh(image);
[seg,x] = mapminmax(imquantize(image,l),0,255);
image =im2uint8(seg);
%se = strel('disk',50);
%image = imopen(image,se);
ci = imcomplement(i);
if num ==1
    score = sum(sum((ci - image).^2));
end
if num ==3
    score = sum(sum((ci - image).^2));
    score1 = sum(sum((i - image).^2));
    score = min(score,score1);
else
    score = sum(sum((i - image).^2));

end

end
