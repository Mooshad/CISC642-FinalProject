function [ CC ] = detectCandidates( I, win_pad )
% http://www.vanaheim-project.eu/assets/BalaSubburamanDescampsCarincotte-PETS-2012.pdf

gray_I = rgb2gray(I);
BW = imgradient(gray_I, 'central');

CC = bwlabel(BW);
%imshow(CC);

[rows cols] = size(CC);

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