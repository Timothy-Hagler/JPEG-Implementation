function idctimage = IDCT(image, N)
    disp("running idct");
    image = double(image);

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

function out = calculateIDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    blah = image;
    for i = 1:N:rowsize % Iterate through all the rows
        for j = 1:N:colsize % Iterate through all the columns
            
            block = zeros(N,N);
            for ublock = 1:N
                for vblock = 1:N
                    doubleSigma = 0; % Used for storing the value of the double 
                                     % sigma resets to 0 after each
                    for u = 1:N
                        for v = 1:N
                            ii = i + ublock - 1;
                            jj = j + vblock - 1;

                            if ii > rowsize
                                ii = rowsize;
                            end
                            if jj > colsize
                                jj = colsize;
                            end
                            F = image(ii,jj);
                            cosIU = cos(((2 * ii + 1) * u * pi) / (2 * N));
                            cosJV = cos(((2 * jj + 1) * v * pi) / (2 * N));
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
                            doubleSigma = doubleSigma + (((2 / N) * Cu * Cv) * (F * cosIU * cosJV));
                            % On next iteration, doubleSigma gets reset to 0
                        end
                    end
                    block(ublock,vblock) = doubleSigma;
                end
            end
            blah(i:i+N-1,j:j+N-1) = block;
            
        end
    end
    out = blah;
end