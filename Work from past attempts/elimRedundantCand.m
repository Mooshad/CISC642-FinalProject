function [ output_args ] = elimRedundantCand( x, y, candidates, win_size)
% This function is used to eliminate redundant candidates in our
% candidate list after finding a match.

% DOESN'T WORK

[rows cols] = size(candidates);

temp = candidates;
for i=1:rows
    i=int16(i);
    disp(i);
    can_x = candidates(i,1); % checking this x coor for redundancy
    can_y = candidates(i,2); % checking this y coor for redundancy
    if(can_x >= x-win_size && can_x <= x+win_size && can_y >= y-win_size && can_y <= y+win_size && (can_x ~= x || can_y ~= y))
        % if true the candidate at spot i is redundant and is removed
        candidates = [candidates(1:i-1, :); candidates(i+1:rows, :)];
        i = int16(i - 1);
        rows = int16(rows - 1);
    end;

end

