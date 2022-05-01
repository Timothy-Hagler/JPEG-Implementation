function [subImg] = FourTwoZeroSubSample(img)
%FourTwoZeroSubSample Subsamples a given image with 4:2:0 subsampling

[r,c,~]=size(img);
subImg= img;

% Perform subsampling
for i=1:2:r
    for j=1:2:c
        if i < r && j < c
            
            % ensure the image keeps correct luminance
            subImg(i+1,j,1)= img(i+1,j,1);
            subImg(i,j+1,1)= img(i,j+1,1);
            subImg(i+1,j+1,1)= img(i+1,j+1,1);
            subImg(i,j,1)= img(i,j,1);

            % convert 4 Cb values to subsampled value
            subImg(i, j, 2)= img(i,j, 2);
            subImg(i+1, j+1, 2)= img(i,j, 2);
            subImg(i+1, j, 2)= img(i,j, 2);
            subImg(i, j+1, 2)= img(i,j, 2);

            % convert 4 Cr values to subsampled value
            subImg(i, j, 3)= img(i,j, 3);
            subImg(i+1, j+1, 3)= img(i,j, 3);
            subImg(i, j+1, 3)= img(i,j, 3);
            subImg(i+1, j, 3)= img(i,j, 3);
        end
    end
end
end