function [ e ] = calcE( data )
%calculates e
[r,c] = size(data);
e =0;
for row=1:r
    if data{row}{1} ~= data{row}{end}
        e = e + data{row}{5};
    end
end

end

