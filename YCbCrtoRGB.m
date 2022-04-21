function [newImg] = YCbCrtoRGB(img,YCbCrToRGBMatrix)
%YCbCrtoRGB will convert given image from YCbCr to RGB

[r,c,d]= size(img);
newImg= img;

% Convert image from YCbCr to RGB
for i=1:r
    for j=1:c

        % Get YCbCr values for pixel
        Y(i,j)= img(i,j,1);
        Cb(i,j)= img(i,j,2);
        Cr(i,j)= img(i,j,3);

        % Combine values into one matrix
        comp= [Y(i,j); Cb(i,j)-0.5; Cr(i,j)-0.5];

        % perform conversion and set pixel
        Sol= YCbCrToRGBMatrix * comp;
        newImg(i,j,:)= Sol;
    end
end
end