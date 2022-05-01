function freqDomainImage = DCT(image, N)
    image = (image);
    
   % freqDomainImage = calculateDCT(image, N);
    
    y = image(:,:,1);
    cb = image(:,:,2);
    cr = image(:,:,3);
    
    newY = calculateDCT(y, N);
    newCb = calculateDCT(cb, N);
    newCr = calculateDCT(cr, N);
    
    freqDomainImage = cat(3, newY, cb, cr);
end

function out = calculateDCT(image, N)
    [rowsize,colsize, ~] = size(image);
    newImg= size(image);
    

   for i=1:8:rowsize
    e = 1;
    for j=1:8:colsize
        block = image(i:i+7,j:j+7);
        cent = double(block) - 128;
        for m=1:8
            for n=1:8
                if m == 1
                    u = 1/sqrt(8);
                else
                    u = sqrt(2/8);
                end
                if n == 1
                    v = 1/sqrt(8);
                else
                    v = sqrt(2/8);
                end
                comp = 0;
                for x=1:8
                    for y=1:8
                        comp = comp + cent(x, y)*(cos((((2*(x-1))+1)*(m-1)*pi)/16))*(cos((((2*(y-1))+1)*(n-1)*pi)/16));
                    end
                end
                  newImg(m, n) = v*u*comp;
              end
        end
        out(i:i+N-1, j:j+N-1)= newImg(:,:);

    end
   end
end