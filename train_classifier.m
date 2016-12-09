function [ data_out ] = train_classifier( tdata,classifier )
%trains a classifier
[r,c] = size(tdata);
dat = cell([1 7]);
for col=1:r
    tdata{col}{end} = classsify(tdata{col},classifier);
end
data_out=tdata;
end

