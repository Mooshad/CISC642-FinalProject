function [ score ] = compare_glcm( image )
%Compares input image using ssd over multiple head images and returns best
%result

image = rgb2gray(image);
stats = graycoprops(graycomatrix(image));

[r,c] = size(image);
x1 = int16(fixo(int16((r/2)-(r/5)),image,1));
x2 = int16(fixo(int16((r/2)+(r/5)),image,1));
y1 = int16(fixo(int16((c/2)-(c/5)),image,0));
y2 = int16(fixo(int16((c/2)+(c/5)),image,0));

window = image(x1:x2,y1:y2);

i1 = rgb2gray(imread('Compare_Heads/bl.JPG'));
i1 = i1(x1:x2,y1:y2);
i1 = graycoprops(graycomatrix(i1));

i2 = rgb2gray(imread('Compare_Heads/blal.JPG'));
i2 = i2(x1:x2,y1:y2);
i2 = graycoprops(graycomatrix(i2));

i3 = rgb2gray(imread('Compare_Heads/blas.JPG'));
i3 = i3(x1:x2,y1:y2);
i3 = graycoprops(graycomatrix(i3));

i4 = rgb2gray(imread('Compare_Heads/brs.JPG'));
i4 = i4(x1:x2,y1:y2);
i4 = graycoprops(graycomatrix(i4));

i5 = rgb2gray(imread('Compare_Heads/bs.JPG'));
i5 = i5(x1:x2,y1:y2);
i5 = graycoprops(graycomatrix(i5));

i6 = rgb2gray(imread('Compare_Heads/gl.JPG'));
i6 = i6(x1:x2,y1:y2);
i6 = graycoprops(graycomatrix(i6));

i7 = rgb2gray(imread('Compare_Heads/gs.JPG'));
i7 = i7(x1:x2,y1:y2);
i7 = graycoprops(graycomatrix(i7));

compare_array = [i1,i2,i3,i4,i5,i6,i7];
score_array =[1000,1000,1000,1000,1000,1000,1000];
[dnm,l] =size(score_array);
for x=1:l
    stats2 = compare_array(x);
    contrast = abs(stats.Contrast-stats2.Contrast);
    score_array(x) = contrast;
end
score = min(score_array);
end

