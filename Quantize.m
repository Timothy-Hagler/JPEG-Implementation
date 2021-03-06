function quantizedImage= Quantize(image, qf , N)
disp("running quant");
    if qf > 100
        qf = 100;
    elseif qf < 1
        qf = 1;
    end

    image = double(image);

    luminanceMatrix = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];

    chrominanceMatrix = [17 18 24 47 99 99 99 99; 18 21 26 66 99 99 99 99; 24 26 56 99 99 99 99 99; 47 66 99 99 99 99 99 99; 99 99 99 99 99 99 99 99; 99 99 99 99 99 99 99 99; 99 99 99 99 99 99 99 99; 99 99 99 99 99 99 99 99];
    [rowsize,colsize, ~] = size(image);
    
    quantizedImage = double(image);

    if qf >= 50
        scaling_factor = (100 - qf) / 50;
    else
        scaling_factor = (50/qf);
    end

    if scaling_factor ~= 0
        QLx = round(luminanceMatrix * scaling_factor);
        QCx = round(chrominanceMatrix * scaling_factor);
        
    else
        QLx = ones(N,N);
        QCx = ones(N,N);
    end
    QLx = uint8((QLx));
    QCx = uint8((QCx));

    QLx = double(QLx);
    QCx = double(QCx);

   for i = 1:N:rowsize
        for j = 1:N:colsize
            if i+N-1 <= rowsize && j+N-1 <= colsize
                y = image(i:i+N-1,j:j+N-1,1);
                cb = image(i:i+N-1,j:j+N-1,2);
                cr = image(i:i+N-1,j:j+N-1,3);
    
                newY = round(y ./ QLx);
                newCb = round(cb ./ QCx);
                newCr = round(cr ./ QCx);
                
                quantizedImage(i:i+N-1,j:j+N-1,1) = newY;
                quantizedImage(i:i+N-1,j:j+N-1,2) = newCb;
                quantizedImage(i:i+N-1,j:j+N-1,3) = newCr;

             end
        end
    end
    quantizedImage = uint8((quantizedImage));
end

