function [ c ] = classify( point,num )
% classifies a given point and determines if it is a head
% or not a head
xyz = point{2};

if num == 1
    if xyz(1) > -1.7
        c = 0;
    end;
elseif num == 2
    if xyz(3) > .1
        c = 0;
    end;
elseif num == 3
    if xyz(1) > -.5 && xyz(1) < .0 && xyz(3) > .1 && xyz(3) < .5
        c = 1;
    end;
end;

end

