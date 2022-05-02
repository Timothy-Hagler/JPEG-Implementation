N = 8;

[img, ~, ~] = imread("pepper.png");

yuvimg = rgb2ycbcr(img);

imwrite(yuvimg, "pepperyuv.png");

subsampledimage = FourTwoZeroSubSample(yuvimg);

imwrite(subsampledimage, "peppersubbed.png");

dctimg = DCT(subsampledimage, N);
%dct2img = dct2(subsampledimage(1:8,1:8,1), 8,8);

imwrite(dctimg,"pepperdct.png");

quantizeimg = Quantize(dctimg, 100, N);

imwrite(quantizeimg, "pepperquantize.png");

dequantizedimg = Dequantize(quantizeimg, N);

imwrite(dequantizedimg, "pepperdequantize.png");

idctimage = IDCT(dequantizedimg, N);

imwrite(idctimage, "pepperidct.png");

rgbimg = ycbcr2rgb(idctimage);

imwrite(rgbimg,"pepperrgb.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);

psnrVal = PSNRvalue(MSEvalue);

disp(psnrVal);
