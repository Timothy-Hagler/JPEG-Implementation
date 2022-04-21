function [newImg] = RGBtoYCbCr(img, YCbCr, const)
% RGBtoYCbCr will convert a given image to YCbCr format


[r,c, d]= size(img);
R= img(:,:,1);
G= img(:,:,2);
B= img(:,:,3);
newImg= zeros(size(img));

% Convert image from RGB to YCbCr
for i=1:r
    for j=1:c
        
        % get RGB values for pixel
        R(i,j)= img(i,j,1);
        G(i,j)= img(i,j,2);
        B(i,j)= img(i,j,3);

        % combine values into one matrix
        rgb= [R(i,j); G(i,j); B(i,j)];

        % perform conversion and set pixel
        Sol= YCbCr*rgb + const;
        newImg(i,j,:)= Sol;
    end
end
end