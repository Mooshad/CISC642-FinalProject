function [ sub ] = thres( sub,t )
[r,c] = size(sub);
for row=1:r
    for col=1:c
        if abs(sub(row,col)) >t
            sub(row,col) = 255;
        else
            sub(row,col) = 0;
        end
    end
end


end

