function [ candidates ] = detectCandidates( I, win_pad )
% http://www.vanaheim-project.eu/assets/BalaSubburamanDescampsCarincotte-PETS-2012.pdf
% I : the image we are detecting candidates from
% win_pad : the padding for the window. The higher this number, the pickier
%           detectCandidates is when returning candidates

% Get laplacian of Image, 
gray_I = rgb2gray(I);
H = fspecial('laplacian');
lap_I = imfilter(gray_I,H,'replicate');
imshow(lap_I);

BW = imgradient(lap_I, 'intermediate');

CC = bwlabel(BW);
imshow(BW);
imshow(CC);

[rows cols] = size(CC);
imshow(CC);

% 1 is white, black is 0
for i=1:rows
    for j=1:cols   
        if(CC(i,j) == 0)
            for i2=i-win_pad:i+win_pad
                for j2=j-win_pad:j+win_pad
                    if(i2 >= 1 && j2 >= 1 && i2 <= rows && j2 <= cols)
                        CC(i2,j2)=1;
                    end;
                end;
            end;
            CC(i,j)=0;
        else
            CC(i,j)=1;
        end;
    end;
end;

% Get candidates coordinates
candidates = [];
for i=1:rows
    for j=1:cols
        if(CC(i,j) == 0)
            candidates = [candidates; i j];
        end;
    end;
end;

            
% Display candidates
for i=1:rows
    for j=1:cols
        if(CC(i,j) == 0)
            for i2=i-2:i+2
                for j2=j-2:j+2
                    if(i2 >= 1 && j2 >= 1 && i2 <= rows && j2 <= cols)
                        I(i2,j2)=255;
                    end;
                end;
            end;
        end;
    end;
end;

imshow(I);


end