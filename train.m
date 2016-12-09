function [ alphas ] = train()
%Trains a adaboost algorithm based off training data
t = 26;
tdatah={1,t};
tdatan={1,t};
for x =1:t
    h = imread(strcat('training_data/H',int2str(x),'.png'));
    n = imread(strcat('training_data/F',int2str(x),'.png'));
    tdatah{x} = h;
    tdatan{x} = n;
end
tdata =cat(2,tdatah,tdatan);
t = 2*t;
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
    x1(z) = compare_entropy(tdata{z});
    y1(z) = compare_gauss(tdata{z},3);
    z1(z) = compare_glcm(tdata{z});
end
for r = (t/2)+1:t
    tinfo = ['not',multi_compare(tdata{r},1),1/t];
    features{r} = {tinfo};
    %[b,n] = size(imfindcircles(tdata{r},[5,50]))
    x2(r-(t/2)) = compare_entropy(tdata{r});
    y2(r-(t/2)) = compare_gauss(tdata{r},3);
    z2(r-(t/2)) = compare_glcm(tdata{r});

end
scatter3(x1,y1,z1,'r','filled')
xlabel('Entropy');
ylabel('Inverse-Gaus');
zlabel('Contrast');
hold on
scatter3(x2,y2,z2,'g','filled')
end

