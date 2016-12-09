function [ out_data ] = updateWeights( data,a )
%updates weights of datapoints
Z = 0;
[r,c] = size(data);
for row=1:r
    Z = Z +data{row}{5};
end
Z
for row=1:r
    if data{row}{1} ~= data{row}{end}
        data{row}{5} = (data{row}{5}.^a)/Z;
    else
        data{row}{5} = 1/Z;
    end
    data{row}{1},data{row}{end},data{row}{5}
end
out_data =data;
end

