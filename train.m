function [ alphas ] = train( t,tdata )
%Trains a adaboost algorithm based off training data
alphas = [];
features = {1,t/2};
x1 =zeros(1,t/2);
y1 =zeros(1,t/2);
x2 =zeros(1,t/2);
y2 =zeros(1,t/2);
z1 = zeros(1,t/2);
z2 = zeros(1,t/2);
for z=1:(t/2)+1
    tinfo = ['head',multi_compare(tdata{z},1),1/t];
    features{z} = {tinfo};
    %[b,n] = size(imfindcircles(tdata{z},[5,50]))
    x1(z) = multi_compare(tdata{z},1);
    y1(z) = compare_gauss(tdata{z},3);
    z1(z) = compare_texture(tdata{z},1);
end
for r = (t/2)+1:t
    tinfo = ['not',multi_compare(tdata{r},1),1/t];
    features{r} = {tinfo};
    %[b,n] = size(imfindcircles(tdata{r},[5,50]))
    x2(r-(t/2)) = multi_compare(tdata{r},1);
    y2(r-(t/2)) = compare_gauss(tdata{r},3);
    z2(r-(t/2)) = compare_texture(tdata{r},1);

end
scatter3(x1,y1,z1,'r','filled')
xlabel('SSD-Score');
ylabel('Inverse-Gaus');
zlabel('texture');
hold on
scatter3(x2,y2,z2,'g','filled')
end

