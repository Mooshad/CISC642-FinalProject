function [ output_args ] = elimRedundantCand( x y candidates win_size)
% This function is used to eliminate redundant candidates in our
% candidate list after finding a match

[rows cols] = size(candidates);

for i=1:rows
    can_x = candidates(i,1); % checking this x coor for redundancy
    can_y = candidates(i,2); % checking this y coor for redundancy
    if(can_x >= x-win_size && can_x <= x+win_size && can_y >= y-win_size && can_y <= y+win_size)
        % if true the candidate at spot i is redundant and is removed
        
    end;

end

