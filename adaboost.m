%Runs Adaboost
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
data = featurespace(2*t,tdata);

e = 5;
num_class = 3;
tcount = 1;
alphas = zeros(1,num_class);

while e>0 && tcount<=num_class
    data = train_classifier(data,tcount);
    e = calcE(data);
    a = log((1-e)/e);
    alphas(tcount) = a;
    data = updateWeights(data,a);
    tcount = tcount+1;
end
alphas

image = imread('pract_img1.jpg');
gimage = rgb2gray(image);
Testpoints = detectCandidates(image,15);
[r,c] = size(Testpoints);
num_heads = 0;
thresh = .3;
for row=1:r
    val = real_classify(image,Testpoints(row,1),Testpoints(row,2),alphas);
    if  val > thresh
        num_heads = num_heads+1;

    end
end
num_heads
