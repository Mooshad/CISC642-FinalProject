function [ val ] = fixo( x,image,xory )
%fixes error of overshooting image when making window
[c,r] = size(image);
val = x;
if xory ==1
    if x <=0
        val = 1;
    end
    if x>= c
        val = c;
    end
else
    if x <=0
        val = 1;
    end
    if x>= r
        val = r;
    end

end

