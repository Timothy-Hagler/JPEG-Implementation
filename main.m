N = 8;

[img, ~, ~] = imread("pepper.png");

yuvimg = rgb2ycbcr(double(img));

imwrite(yuvimg, "pepperyuv.png");

subsampledimage = FourTwoZeroSubSample(yuvimg);

imwrite(subsampledimage, "peppersubbed.png");

dctimg = DCT(subsampledimage, N);

imwrite(dctimg,"pepperdct.png");

quantizeimg = Quantize(dctimg, 100, N);

imwrite(quantizeimg, "pepperquantize.png");

dequantizedimg = Dequantize(quantizeimg, N);

imwrite(quantizeimg, "pepperdequantize.png");

idctimage = IDCT(dctimg, N);

imwrite(idctimage, "pepperidct.png");

rgbimg = ycbcr2rgb(idctimage);

imwrite(rgbimg,"pepperrgb.png");