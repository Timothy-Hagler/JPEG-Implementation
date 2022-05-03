function MSEout = MSE(original, output)
disp("running mse")
    original = double(original./255);
    output = double(output)./255;

[rowsize,colsize, ~] = size(original);
sum = 0;
M =8;
N=8;
    for i = 1:rowsize
        for j = 1:colsize
            originalpixel = original(i, j);
            outputpixel = output(i ,j);
            diff = originalpixel - outputpixel; 
            squared = diff * diff;
            sum = sum + squared;
        end
    end

    sum = sum /(M * N);
    MSEout = sum;
end