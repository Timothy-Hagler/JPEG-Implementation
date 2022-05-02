function MSEout = MSE(original, output)
    original = (original);
    output = (output);

[rowsize,colsize, ~] = size(original);
sum =0;
M =8;
N=8;
    for i = 1:M:rowsize
        for j = 1:N:colsize
            originalpixel= original(i, j);
            outputpixel = output(i ,j);
            diff = originalpixel - outputpixel; 
            squared = diff * diff;
            sum =+diff;
        end
    end

    sum = sum /(M * N);
    MSEout =sum;
end