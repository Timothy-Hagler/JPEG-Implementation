N = 8;      % size of blocks

% Pepper file
[img, ~, ~] = imread("pepper.png");

yuvimg = rgb2ycbcr(img);

subsampledimage = FourTwoZeroSubSample(yuvimg);

dctimg = DCT(subsampledimage, N);

% qf = 100
quantizeimg = Quantize(dctimg, 100, N);
dequantizedimg = Dequantize(quantizeimg, N, 100);

% qf = 50
quantize50img = Quantize(dctimg, 50, N);
dequantized50img = Dequantize(quantize50img, N, 50);

% qf = 5
quantize5img = Quantize(dctimg, 5, N);
dequantized5img = Dequantize(quantize5img, N, 5);

idctimage = IDCT(dequantizedimg, N);
idct50image = IDCT(dequantized50img, N);
idct5image = IDCT(dequantized5img, N);

rgbimg = ycbcr2rgb(idctimage);
rgb50img = ycbcr2rgb(idct50image);
rgb5img = ycbcr2rgb(idct5image);

imwrite(rgbimg,"output_pepper_qf100.png");
imwrite(rgb50img,"output_pepper_qf50.png");
imwrite(rgb5img,"output_pepper_qf5.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);

psnrVal = PSNRvalue(double(MSEvalue));

disp(psnrVal);


% ALU.tif file

[img, ~, ~] = imread("alu.tif");

yuvimg = rgb2ycbcr(img);

subsampledimage = FourTwoZeroSubSample(yuvimg);

dctimg = DCT(subsampledimage, N);

%qf = 100
quantizeimg = Quantize(dctimg, 100, N);
dequantizedimg = Dequantize(quantizeimg, N, 100);

% qf = 50
quantize50img = Quantize(dctimg, 50, N);
dequantized50img = Dequantize(quantize50img, N, 50);

% qf = 5
quantize5img = Quantize(dctimg, 5, N);
dequantized5img = Dequantize(quantize5img, N, 5);

idctimage = IDCT(dequantizedimg, N);
idct50image = IDCT(dequantized50img, N);
idct5image = IDCT(dequantized5img, N);

rgbimg = ycbcr2rgb(idctimage);
rgb50img = ycbcr2rgb(idct50image);
rgb5img = ycbcr2rgb(idct5image);

imwrite(rgbimg,"output_alu_qf100.png");
imwrite(rgb50img,"output_alu_qf50.png");
imwrite(rgb5img,"output_alu_qf5.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);

psnrVal = PSNRvalue(double(MSEvalue));

disp(psnrVal);
