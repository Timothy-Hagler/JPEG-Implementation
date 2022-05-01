function freqDomainImage = DCT(image, N)
    image = (image);
    
   % freqDomainImage = calculateDCT(image, N);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateDCT(y, N);
    newCb = calculateDCT(cb, N);
    newCr = calculateDCT(cr, N);
    
    freqDomainImage = cat(3, newY, newCb, newCr);
end

function out = calculateDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    newImg= size(image);
    

    for x=1:8:rowsize
        for y=1:8:colsize
            for u=1:8
                for v=1:8
                    sum= 0;
                    Cu= 1;
                    Cv= 1;
                    if u==0
                        Cu= sqrt(2) / 2;
                    end
                    if v==0
                        Cv= sqrt(2) / 2;
                    end
                    
                    for i=1:N
                        for j=1:N
                            sum= sum + (cos(((2 * i + 1)*u*pi)/(2*N))*cos(((2 * j + 1)*v*pi)/(2*N))) * image(x,y);
                        end
                    end
        
                    newImg(u,v)= ((2 * Cu * Cv) / N) * sum;
                    
                end
            end
            out(x:x+N-1, y:y+N-1)= newImg(:,:);
        end
    end

    %out= newImg;

end