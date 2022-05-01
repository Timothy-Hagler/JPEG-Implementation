function idctimage = IDCT(image, N)
    image = double(image);
    
    %freqDomainImage = calculateDCT(image, N);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateIDCT(y, N);
    newCb = calculateIDCT(cb, N);
    newCr = calculateIDCT(cr, N);
    
    idctimage = cat(3, newY, newCb, newCr);
end

function out = calculateIDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    blah = image;
    for u = 1:N:rowsize % Iterate through all the rows
        
        for v = 1:N:colsize % Iterate through all the columns
            idctBlock = zeros(N,N); % Create an NxN matrix filled with 0s
            for i = 1:N % Iterate from 1 through N for the 
                        % u (rows) of the NxN block
                for j = 1:N % Iterate from 1 through N for the 
                            % v (columns) of the NxN block
                    doubleSigma = 0; % Used for storing the value of the double 
                                     % sigma resets to 0 after each 
                    for x = 1:N % Iterate from 1 through N for row
                        for y = 1:N % Iterate from 1 through for column
                            pixel = image(u,v);
                            cosUX = cos(((2 * x + 1) * i * pi) / (2 * N));
                            cosVY = cos(((2 * y + 1) * j * pi) / (2 * N));
                            if i == 0
                                Ci = 1 / sqrt(2);
                            else
                                Ci = 1;
                            end
                            if u == 0
                                Cj = 1 / sqrt(2);
                            else
                                Cj = 1;
                            end

                            % Calculate the double sigma value for the specific
                            % index of the idctBlock
                            doubleSigma = doubleSigma + (((2 / N) * Ci * Cj) * (pixel * cosUX * cosVY));
                            % If the u or v value is 0 use 1/sqrt(2)
                            % Otherwise use 1
                            
                            % Storing the calculation 
                            idctBlock(i,j) =  doubleSigma;
                            % On next iteration, doubleSigma gets reset to 0
                        end
                    end
                    
                end
            end
            blah(u:u+N-1,v:v+N-1) = idctBlock;
        end
    end
    out = blah;
end