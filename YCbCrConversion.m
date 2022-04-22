clear all;

% Team: Team Team-Team 
% CS 443-01
% 05-02-22

% Load images to subsample
img1=imread('alu.tif');
img2=imread('pepper.png');

% Normalize images
img1= double(img1)./255;
img2= double(img2)./255;

% Copy the images into new variables
newImg1= img1;  % for normal subsample
newImg2= img2;  % for normal subsample
newImg3= img1;  % for cosited
newImg4= img2;  % for cosited

% Conversion matrices
YCbCr = [0.299 0.587 0.114; -0.16874 -0.33126 0.5; 0.5 -0.41869 -0.08131];
YCbCrToRGBMatrix= [1 0 1.402; 1 -0.34414 -0.71414; 1 1.77200 0];
const = [0; 0.5; 0.5];

% Subsample 4:2:0 Image 1
newImg1= RGBtoYCbCr(newImg1, YCbCr, const);
newImg1 = FourTwoZeroSubSample(newImg1);
newImg1= YCbCrtoRGB(newImg1, YCbCrToRGBMatrix);

% Co-sited 4:2:0 Image 1
newImg3= RGBtoYCbCr(newImg3, YCbCr, const);
newImg3 = FourTwoZeroCositedSample(newImg3);
newImg3= YCbCrtoRGB(newImg3, YCbCrToRGBMatrix);

% Subsample 4:2:0 Image 2
newImg2= RGBtoYCbCr(newImg2, YCbCr, const);
newImg2 = FourTwoZeroSubSample(newImg2);
newImg2= YCbCrtoRGB(newImg2, YCbCrToRGBMatrix);

% Co-sited 4:2:0 Image 2
newImg4= RGBtoYCbCr(newImg4, YCbCr, const);
newImg4 = FourTwoZeroCositedSample(newImg4);
newImg4= YCbCrtoRGB(newImg4, YCbCrToRGBMatrix);

% Plot all 4 images
subplot(2,2,1),imshow(newImg1);
subplot(2,2,2),imshow(newImg3);
subplot(2,2,3),imshow(newImg2);
subplot(2,2,4),imshow(newImg4);

% Save each image to a file
imwrite(newImg1,"alu_Subsample.png");
imwrite(newImg3,"alu_cosited.png");
imwrite(newImg2,"pepper_Subsample.png");
imwrite(newImg4,"pepper_cosited.png");