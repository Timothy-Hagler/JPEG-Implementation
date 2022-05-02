N = 8;

[img, ~, ~] = imread("GroupProject/pepper.png");

yuvimg = rgb2ycbcr(img);

imwrite(yuvimg, "pepperyuv.png");

subsampledimage = FourTwoZeroSubSample(yuvimg);

imwrite(subsampledimage, "peppersubbed.png");

dctimg = DCT(subsampledimage, N);

imwrite(dctimg,"pepperdct.png");

quantizeimg = Quantize(dctimg, 100, N);

imwrite(quantizeimg, "pepperquantize.png");

dequantizedimg = Dequantize(quantizeimg, N);

imwrite(quantizeimg, "pepperdequantize.png");

idctimage = IDCT(dequantizedimg, N);

imwrite(idctimage, "pepperidct.png");

rgbimg = ycbcr2rgb(idctimage);

imwrite(rgbimg,"pepperrgb.png");

MSEvalue = MSE(img, rgbimg);

disp(MSEvalue);
