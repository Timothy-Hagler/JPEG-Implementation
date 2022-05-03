N = 8;

for filename = ["pepper.png","alu.tif"]
    splitFileName = strsplit(filename,".");
    % Pepper file
    [img, ~, ~] = imread(filename);
    
    yuvimg = rgb2ycbcr(img);
    
    imwrite(yuvimg, strcat("OutputImgs/",splitFileName(1),"yuv.png"));
    
    subsampledimage = FourTwoZeroSubSample(yuvimg);
    
    imwrite(subsampledimage, strcat("OutputImgs/",splitFileName(1),"subbed.png"));
    
    dctimg = DCT(subsampledimage, N);
    
    imwrite(dctimg,strcat("OutputImgs/",splitFileName(1),"dct.png"));
    
    for qFactor = [5,50,100]
    
        quantizeimg = Quantize(dctimg, qFactor, N);

        quantfile = sprintf("OutputImgs/%s_Quantized_Q-%d.png",splitFileName(1), qFactor);
        imwrite(quantizeimg, quantfile);
        
        dequantizedimg = Dequantize(quantizeimg, N, qFactor);
        
        dequantfile = sprintf("OutputImgs/%s_Dequantized_Q-%d.png",splitFileName(1), qFactor);
        imwrite(dequantizedimg, dequantfile);
        
        idctimage = IDCT(dequantizedimg, N);
        
        idctfile = sprintf("OutputImgs/%s_idct_Q-%d.png",splitFileName(1), qFactor);
        imwrite(idctimage, idctfile);
        
        rgbimg = ycbcr2rgb(idctimage);
    
    
        rgbfile = sprintf("OutputImgs/%s_rgb_Q-%d.png",splitFileName(1), qFactor);
        imwrite(rgbimg,rgbfile);
        
        MSEvalue = MSE(img, rgbimg);
        
        disp(MSEvalue);
        
        psnrVal = PSNRvalue(double(MSEvalue));
        
        disp(psnrVal);
    end

end


% % ALU.tif file
% 
% [img, ~, ~] = imread("alu.tif");
% 
% yuvimg = rgb2ycbcr(img);
% 
% imwrite(yuvimg, "aluyuv.png");
% 
% subsampledimage = FourTwoZeroSubSample(yuvimg);
% 
% imwrite(subsampledimage, "alusubbed.png");
% 
% dctimg = DCT(subsampledimage, N);
% 
% imwrite(dctimg,"aludct.png");
% 
% quantizeimg = Quantize(dctimg, 50, N);
% 
% imwrite(quantizeimg, "aluquantize.png");
% 
% dequantizedimg = Dequantize(quantizeimg, N, 50);
% 
% imwrite(dequantizedimg, "aludequantize.png");
% 
% idctimage = IDCT(dequantizedimg, N);
% 
% imwrite(idctimage, "aluidct.png");
% 
% rgbimg = ycbcr2rgb(idctimage);
% 
% 
% imwrite(rgbimg,"alurgb.png");
% 
% MSEvalue = MSE(img, rgbimg);
% 
% disp(MSEvalue);
% 
% psnrVal = PSNRvalue(double(MSEvalue));
% 
% disp(psnrVal);
