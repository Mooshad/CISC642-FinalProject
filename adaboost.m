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
train(2*t,tdata)