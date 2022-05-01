function freqDomainImage = DCT(image, N)
    disp("running dct");
    image = double(image);
    
    y = image(:,:,1) ./ 255;
    cb = image(:,:,2) ./ 255;
    cr = image(:,:,3) ./ 255;
    
    newY = calculateDCT(y, N);
    newCb = calculateDCT(cb, N);
    newCr = calculateDCT(cr, N);
    
    freqDomainImage(:,:,1) = newY;
    freqDomainImage(:,:,2) = newCb; 
    freqDomainImage(:,:,3) = newCr;
end

function out = calculateDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    blah = image;
    for i = 1:N:rowsize % Iterate through all the rows
        
        for j = 1:N:colsize % Iterate through all the columns
            dctBlock = zeros(N,N); % Create an NxN matrix filled with 0s
            for u = 1:N % Iterate from 1 through N for the 
                        % u (rows) of the NxN block
                for v = 1:N % Iterate from 1 through N for the 
                            % v (columns) of the NxN block
                    doubleSigma = 0; % Used for storing the value of the double 
                                     % sigma resets to 0 after each 
                    for uu = 1:N % Iterate from 1 through N for row
                        for vv = 1:N % Iterate from 1 through for column
                            f = image(i+uu-1,j+vv-1);
                            cosIX = cos(((2 * i+uu-1 + 1) * u * pi) / (2 * N));
                            cosJY = cos(((2 * i+vv-1 + 1) * v * pi) / (2 * N));
                            
                            % Calculate the double sigma value for the specific
                            % index of the dctBlock
                            doubleSigma = doubleSigma + (f * cosIX * cosJY);
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
                    dctBlock(u,v) = (2 / N) * Cu * Cv * doubleSigma;
                    % On next iteration, doubleSigma gets reset to 0
                end
            end
            blah(i:i+N-1,j:j+N-1) = dctBlock;
        end
    end
    out = blah;
end