function [ dout ] = featurespace( t,tdata )
%Trains a adaboost algorithm based off training data
x1 =zeros(1,t/2);
y1 =zeros(1,t/2);
x2 =zeros(1,t/2);
y2 =zeros(1,t/2);
z1 = zeros(1,t/2);
z2 = zeros(1,t/2);
dout = cell([(t/2) 1]);
for z=1:(t/2)+1
    tinfo = {1,(multi_compare(tdata{z},1)),(compare_gauss(tdata{z},3)),(compare_texture(tdata{z},1)),1/t,0,0};
    x1(z) = tinfo{2};
    y1(z) = tinfo{3};
    z1(z) = tinfo{4};
    dout{z} = tinfo;
    
end
for r = (t/2)+1:t
    tinfo = {0,multi_compare(tdata{r},1),(compare_gauss(tdata{r},3)),compare_texture(tdata{r},1),1/t,0,0};
    x2(r-(t/2)) = tinfo{2};
    y2(r-(t/2)) = tinfo{3};
    z2(r-(t/2)) = tinfo{4};
    dout{r} = tinfo;

end
x=cat(2,x1,x2);
y=cat(2,y1,y2);
z = cat(2,y1,y2);
end