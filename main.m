N = 8;

% Pepper file
[img, ~, ~] = imread("pepper.png");

yuvimg = rgb2ycbcr(img);
rgb = ycbcr2rgb(yuvimg);

imwrite(yuvimg, "pepperyuv.png");

subsampledimage = FourTwoZeroSubSample(yuvimg);

imwrite(subsampledimage, "peppersubbed.png");

dctimg = DCT(subsampledimage, N);
dct2img = dct2(subsampledimage(:,:,1), 8,8);

imwrite(dctimg,"pepperdct.png");

quantizeimg = Quantize(dctimg, 50, N);

imwrite(quantizeimg, "pepperquantize.png");

dequantizedimg = Dequantize(quantizeimg, N, 50);

imwrite(dequantizedimg, "pepperdequantize.png");

idctimage = IDCT(dequantizedimg, N);

imwrite(idctimage, "pepperidct.png");

rgbimg = ycbcr2rgb(idctimage);


imwrite(rgbimg,"pepperrgb.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);

psnrVal = PSNRvalue(double(MSEvalue));

disp(psnrVal);




% ALU.tif file

[img, ~, ~] = imread("alu.tif");

yuvimg = rgb2ycbcr(img);

imwrite(yuvimg, "aluyuv.png");

subsampledimage = FourTwoZeroSubSample(yuvimg);

imwrite(subsampledimage, "alusubbed.png");

dctimg = DCT(subsampledimage, N);
%dct2img = dct2(subsampledimage(1:8,1:8,1), 8,8);

imwrite(dctimg,"aludct.png");

quantizeimg = Quantize(dctimg, 50, N);

imwrite(quantizeimg, "aluquantize.png");

dequantizedimg = Dequantize(quantizeimg, N, 50);

imwrite(dequantizedimg, "aludequantize.png");

idctimage = IDCT(dctimg, N);

imwrite(idctimage, "aluidct.png");

rgbimg = ycbcr2rgb(idctimage);


imwrite(rgbimg,"alurgb.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);

psnrVal = PSNRvalue(double(MSEvalue));

disp(psnrVal);
