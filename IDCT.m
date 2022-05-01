function idctimage = IDCT(image, N)
    image = (image);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateIDCT(y, N);
    %newCb = calculateIDCT(cb, N);
    %newCr = calculateIDCT(cr, N);
    
    idctimage = cat(3, newY, cb, cr);
end

function out = calculateIDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    newImg= size(image);
    
   for i=1:8:rowsize
    e = 1;
       for j=1:8:colsize
           for x = 1:8
                for y = 1:8
                    comp = 0;
                    for m = 1:8
                        for n = 1:8
                            if m == 1
                                u = 1/sqrt(2);
                            else
                                u = 1;
                            end
                            if n == 1
                                v = 1/sqrt(2);
                            else
                                v = 1;
                            end
                            
                          newImg(m, n) = v*u*comp;
                        end
                    end
                end
                out(i:i+N-1, j:j+N-1)= newImg(:,:);
            end
        end
   end
end
