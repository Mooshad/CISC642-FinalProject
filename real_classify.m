function [ total ] = real_classify( image,x,y,alphas)
%Classifies a image window based on adaboost training
gimage = rgb2gray(image);
window_size = 20;
x1 = x-window_size;
x2 = x+window_size;
y1 = y-window_size;
y2 = y+window_size;
window = image(fixo(x1,gimage,1):fixo(x2,gimage,1),fixo(y1,gimage,0):fixo(y2,gimage,0),:);
%size(window),x1,x2,y1,y2,fixo(y1,gimage,0),fixo(y2,gimage,0)
%size(image),x,y
%image(20,500)
point= {1,(compare_entropy(window)),(compare_gauss(window,3)),(compare_glcm(window)),0,0,0};

[r,c] = size(alphas);
total = 0;
for col=1:c
    total = total + alphas(col)*classify(point,col);
end
total;



end

