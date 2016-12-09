one = rgb2gray(imread('1.JPG'));
two = rgb2gray(imread('2.JPG'));
three = rgb2gray(imread('3.JPG'));
four = rgb2gray(imread('4.JPG'));
five = rgb2gray(imread('5.JPG'));

[r,c] = size(one);
result = zeros(r,c);

result = imadd((imadd((imadd((imadd(one,two)/2),three)/2),four)/2),five)/2;
result2 = imadd(imadd(imadd(imadd(one,two),three),four),five)/5;
result3 = mean([mean2(one),mean2(two),mean2(three),mean2(four),mean2(five)]);


imshow(result);
figure
imshow(3*imsubtract(four,result3));
% figure
% imshow(four-mean2(result2));
% figure
% imshow(four);
