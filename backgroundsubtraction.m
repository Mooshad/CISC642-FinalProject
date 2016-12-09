%Performs background subtraction,erosion, median filter, labels connected
%components

%Outside kirkbride
one = rgb2gray(imread('1.JPG'));
two = rgb2gray(imread('2.JPG'));
three = rgb2gray(imread('3.JPG'));
four = rgb2gray(imread('4.JPG'));
five = rgb2gray(imread('5.JPG'));

iarray ={one,two,three,four,five};

backsub(iarray,60);

%Inside Smith
one = imrotate(rgb2gray(imread('s1.JPG')),90);
two = imrotate(rgb2gray(imread('s2.JPG')),90);
three = rgb2gray(imread('s3.JPG'));
four = rgb2gray(imread('s4.JPG'));
five = rgb2gray(imread('s5.JPG'));

iarray ={one,two,three,four,five};

backsub(iarray,60);
