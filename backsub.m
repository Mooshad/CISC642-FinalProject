function [ output_args ] = backsub( iarray,t )
%performs background subtraction,erosion,bwlabel
[sizeb,sizea] = size(iarray);
curr = iarray{1};
for s=2:sizea
    diff = abs(curr-iarray{s});
    result = thres(diff,t);
end
  

imshow(iarray{end});
figure

se = offsetstrel('ball',5,5);
erodedI = imerode(result,se);
%h = fspecial('average',11);
erodedI = medfilt2(imerode(erodedI,se));
[c,num_heads] = bwlabel(erodedI);
imshow(c);
num_heads



end

