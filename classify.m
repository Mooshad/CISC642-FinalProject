function [ c ] = classify( point,num )
% classifies a given point and determines if it is a head
% or not a head
x = point{2};
y = point{3};
z = point{4};
c = 0;

if num == 1
    if x > -1.7
        c = 1;
    end;
elseif num == 2
    if z > .1
        c = 1;
    end;
elseif num == 3
    if x > -.5 && x < 0 && z > .1 && z < .5
        c = 1;
    end;
end;

end

