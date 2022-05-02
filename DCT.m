function freqDomainImage = DCT(image, N)
    disp("running dct");
    image = (image);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateDCT(y, N);
    newCb = calculateDCT(cb, N);
    newCr = calculateDCT(cr, N);
    
    freqDomainImage(:,:,1) = newY;
    freqDomainImage(:,:,2) = newCb; 
    freqDomainImage(:,:,3) = newCr;
end

function out = calculateDCT(in, N)
    [rowsize,colsize, ~] = size(in);
    F = in;
    for x = 1:N:rowsize % Get every 8th row of the input image
        for y = 1:N:colsize % Get every 8th column of the input image
            if x+N-1 <= rowsize && y+N-1 <= colsize
                f = in(x:x+N-1,y:y+N-1); % Create an NxN matrix filled with 0s to store the current block in
                dcted = actuallyDoThecalculationForDCT(f,N);
                F(x:x+N-1,y:y+N-1) = dcted;
            end
        end
    end
    out = F;
end

function out = actuallyDoThecalculationForDCT(in, N)
f = in;

doubleSigma = 0; % Used for storing the value of the double sigma.

% i is the current first sigma value
for i = 1:N % Iterate from 1 through N for row

    % j is the current second sigma value
    for j = 1:N % Iterate from 1 through for column
        % fpixel is the pixel value of the block index
        % currently being operated on
        fpixel = f(i,j);

        cosIX = cos(((2 * (i) + 1) * (0) * pi) / (2 * N));
        cosJY = cos(((2 * (j) + 1) * (0) * pi) / (2 * N));
        
        % Calculate the double sigma value for the specific
        % index of the block
        doubleSigma = doubleSigma + (fpixel * cosIX * cosJY);
    end
end
% If the u or v value is 1 use 1/sqrt(2)
% Otherwise use 1
Cu = 1 / sqrt(2);
Cv = 1 / sqrt(2);
% Storing the calculation 
f(1,1) = (2 / N) * Cu * Cv * doubleSigma;

    

out = f;
end