function idctimage = IDCT(image, N)
    image = (image);
    
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
    newImg= size(image);
    

    for x=1:8:rowsize
        for y=1:8:colsize
            for i=1:8
                for j=1:8
                    sum= 0;
                    
                    
                    for u=1:N
                        for v=1:N
                            Cu= 1;
                            Cv= 1;
                            if u==0
                                Cu= sqrt(2) / 2;
                            end
                            if v==0
                                Cv= sqrt(2) / 2;
                            end
                            sum= sum + ((2 * Cu * Cv) / N) * (cos(((2 * i + 1)*u*pi)/(2*N))*cos(((2 * j + 1)*v*pi)/(2*N))) * image(i,j);
                           % sum= ((2 * Cu * Cv) / N) * sum;
                        end
                    end
        
                    newImg(i,j)= sum;
                   % out(x:x+i, y:y+j)= sum;
                    
                end
                
            end
            out(x:x+N-1, y:y+N-1)= newImg(:,:);
           % newImg= zeros(size(image));
        end
    end
end