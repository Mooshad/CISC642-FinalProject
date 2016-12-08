function [ candidates ] = detectCandidates( I, win_pad )
% http://www.vanaheim-project.eu/assets/BalaSubburamanDescampsCarincotte-PETS-2012.pdf
% I : the image we are detecting candidates from
% win_pad : the padding for the window. The higher this number, the pickier
%           detectCandidates is when returning candidates

% Use k-means to cluster image, k=3
% cform = makecform('srgb2lab');
% lab_I = applycform(I, cform);
% 
% ab = double(lab_I(:,:,2:3));
% nrows = size(ab,1);
% ncols = size(ab,2);
% ab = reshape(ab,nrows*ncols,2);
% 
% nColors = 5;
% 
% [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', 'Replicates',3);
% 
% pixel_labels = reshape(cluster_idx,nrows,ncols);
% 
% imshow(pixel_labels,[]), title('image labeled by cluster index');

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
                
                
%             g_x = double(g_I(i,j-1)) - double(g_I(i, j+1));
%             %disp(i);
%             %disp(j);
%             g_y = double(g_I(i-1,j)) - double(g_I(i+1, j));
%             
%             mag = sqrt(g_x^2+g_y^2);
%             orient = atan(g_y/g_x);
% 
%             if(orient > .3 && orient < .6)
%                 CC(i,j) = 1;
%             end;
%         end;
%     end;
% end;


% g_I = rgb2gray(I);
% [rows cols] = size(g_I);
% 
% BI = zeros([rows cols]);
% 
% for i=1:rows-1
%     for j=1:cols-1
%         if(i > 1 && j > 1)
%             g_x = double(g_I(i,j-1)) - double(g_I(i, j+1));
%             %disp(i);
%             %disp(j);
%             g_y = double(g_I(i-1,j)) - double(g_I(i+1, j));
%             
%             mag = sqrt(g_x^2+g_y^2);
%             orient = atan(g_y/g_x);
% 
%             if(orient > .3 && orient < .6)
%                 BI(i,j) = 1;
%             end;
%         end;
%     end;
% end;
% 
% CC = bwconncomp(logical(BI));
% imshow(CC);

end