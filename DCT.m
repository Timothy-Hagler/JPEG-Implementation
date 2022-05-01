function freqDomainImage = DCT(image, N)
    image = double(image);
    
    %freqDomainImage = calculateDCT(image, N);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateDCT(y, N);
    newCb = calculateDCT(cb, N);
    newCr = calculateDCT(cr, N);
    
    freqDomainImage = cat(3, newY, newCb, newCr) ./ 255;
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
                    for x = 1:N % Iterate from 1 through N for row
                        for y = 1:N % Iterate from 1 through for column
                            pixel = image(i,j);
                            cosIX = cos(((2 * i + 1) * x * pi) / 2 * N);
                            cosJY = cos(((2 * j + 1) * y * pi) / 2 * N);
                            
                            % Calculate the double sigma value for the specific
                            % index of the dctBlock
                            doubleSigma = doubleSigma + pixel * cosIX * cosJY;
                        end
                    end
                    % If the u or v value is 0 use 1/sqrt(2)
                    % Otherwise use 1
                    if u == 0
                        Cu = 1 / sqrt(2);
                    else
                        Cu = 1;
                    end
                    if v == 0
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