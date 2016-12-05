function [ centers radii ] = detectCandidates( image )
% Input: [Image] A top down image view in which we find the potential candidates
%        for AdaBoost
% Output: [centers, radii] - Center is a two column vector indicating the
%        centers for our candidates.  Radii is a 1 column vector of the
%        radii for each center.

[centers, radii] = imfindcircles(image, [10 90]);

imshow(image);
viscircles(centers, radii,'EdgeColor','b');

end

