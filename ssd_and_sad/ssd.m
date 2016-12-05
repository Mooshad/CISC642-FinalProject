function [ corr_matches ] = ssd( to_be_matched, I1, I2, win_x, win_y)
% Find correspondences using ssd given features in image 1,
% image 1, and image 2

%I1_g = rgb2gray(I1);
%I2_g = rgb2gray(I2);

I1_p = padarray(I1, [win_y win_x]);
I2_p = padarray(I2, [win_y win_x]);

match_count = size(to_be_matched);
img_size = size(I1);

corr_matches = zeros(match_count) - 1;

for i=1:match_count(1)
    x = to_be_matched(i, 1) + win_x;
    y = to_be_matched(i, 2) + win_y;
    
    curr_ssd = 50000; % this sets the threshold for finding a sad/ssd/ncc
    location = [-1 -1]; % this is the location of the found correspondence
    mat1 = I1_p(y - win_y:y+ win_y, x-win_x:x+win_x, :); %matlab has index backwards here
    for m = win_x+1:img_size(2);
        mat2 = I2_p(y - win_y:y+ win_y, m-win_x:m+win_x, :);
        
        difference = int16(mat1) - int16(mat2);
        ssd_value = sum(difference(:).^2);
        if (ssd_value < curr_ssd)
            curr_ssd = ssd_value;
            location = [m y];
        end;
    end;
    corr_matches(i,1) = uint16(location(1) - win_x);
    corr_matches(i,2) = uint16(location(2) - win_y);
end;

%figure;
%imshow(I2); hold on;
%for i=1:match_count(1)
%    if(corr_matches(i, 1) > 0)
%        plot(corr_matches(i,1), corr_matches(i, 2), 'b.', 'MarkerSize', 10);
%    end
end


