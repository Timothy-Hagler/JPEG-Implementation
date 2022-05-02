function freqDomainImage = DCT(image, N)
    disp("running dct");
    image = double(image);
    
    y = image(:,:,1)-128;
    cb = image(:,:,2)-128;
    cr = image(:,:,3)-128;
    
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

            f = in(x:x+N-1,y:y+N-1); % Create an NxN matrix filled with 0s to store the current block in
            dcted = actuallyDoThecalculationForDCT(f,N);
            F(x:x+N-1,y:y+N-1) = dcted;
        end
    end
    out = F;
end

function out = actuallyDoThecalculationForDCT(in, N)
f = in;
% u is the current row index in the block
for u = 1:1 % Iterate from 1 through N

    % v is the current column index in the block
    for v = 1:1 % Iterate from 1 through N

        doubleSigma = 0; % Used for storing the value of the double 
                         % sigma. resets to 0 after each
                         % iteration
        
        % i is the current first sigma value
        for i = 1:N % Iterate from 1 through N for row

            % j is the current second sigma value
            for j = 1:N % Iterate from 1 through for column
                % fpixel is the pixel value of the block index
                % currently being operated on
                fpixel = f(i,j);

                cosIX = cos(((2 * (i-1) + 1) * (u-1) * pi) / (2 * N));
                cosJY = cos(((2 * (j-1) + 1) * (v-1) * pi) / (2 * N));
                
                % Calculate the double sigma value for the specific
                % index of the block
                doubleSigma = doubleSigma + (fpixel * cosIX * cosJY);
            end
        end
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
        % Storing the calculation 
        f(u,v) = (2 / N) * Cu * Cv * doubleSigma;
        % On next iteration, doubleSigma gets reset to 0
    end
end
out = f;
end