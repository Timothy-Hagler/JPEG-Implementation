function idctimage = IDCT(image, N)
    disp("running idct");
    image = (image);

    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateIDCT(y,N);
    newCb = calculateIDCT(cb,N);
    newCr = calculateIDCT(cr,N);
    
    idctimage(:,:,1) = newY;
    idctimage(:,:,2) = newCb; 
    idctimage(:,:,3) = newCr; 
end

function out = calculateIDCT(in, N)
    [rowsize,colsize, ~] = size(in);
    f = in;
    for x = 1:N:rowsize % Iterate through all the rows
        for y = 1:N:colsize % Iterate through all the columns
            if x+N-1 <= rowsize && y+N-1 <= colsize
                F = in(x:x+N-1, y:y+N-1);
                idcted = actuallyDoTheCalculationForIDCT(F,N);
                f(x:x+N-1, y:y+N-1) = idcted;
            end
        end
    end
    out = f;
end

function out = actuallyDoTheCalculationForIDCT(in,N)
f = in;

doubleSigma = 0; % Used for storing the value of the double sigma


                 
for u = 1:N
    for v = 1:N

        Fpixel = in(1, 1);

        cosIU = cos(((2 * (0) + 1) * (u) * pi) / (2 * N));
        cosJV = cos(((2 * (0) + 1) * (v) * pi) / (2 * N));

        % If the u or v value is 1 use 1/sqrt(2)
        % Otherwise use 1
        if u == 1
            Cu = 1 / sqrt(2);
        else
            Cu = 1;
        end
        if v == 1
            Cv = 1 / sqrt(2);
        else
            Cv = 1;
        end

        % Calculate the double sigma value for the specific
        % index of the idctBlock
        doubleSigma = doubleSigma + ((((2 * Cu * Cv) / N) * Fpixel * cosIU * cosJV));
    end
end
f(1, 1) = doubleSigma;
       
out = f;
end