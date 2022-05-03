N = 8;      % size of blocks

for filename = ["pepper.png","alu.tif"]
    splitFileName = strsplit(filename,".");
    % Pepper file
    [img, ~, ~] = imread(filename);
    
    yuvimg = rgb2ycbcr(img);
    
    imwrite(yuvimg, strcat(splitFileName(1),"yuv.png"));
    
    subsampledimage = FourTwoZeroSubSample(yuvimg);
    
    imwrite(subsampledimage, strcat(splitFileName(1),"subbed.png"));
    
    dctimg = DCT(subsampledimage, N);
    
    imwrite(dctimg,strcat(splitFileName(1),"dct.png"));
    
    for qFactor = [5,50,100]
    
        quantizeimg = Quantize(dctimg, qFactor, N);

        quantfile = sprintf("%s_quantized_qf%d.png",splitFileName(1), qFactor);
        imwrite(quantizeimg, quantfile);
        
        dequantizedimg = Dequantize(quantizeimg, N, qFactor);
        
        dequantfile = sprintf("%s_dequantized_qf%d.png",splitFileName(1), qFactor);
        imwrite(dequantizedimg, dequantfile);
        
        idctimage = IDCT(dequantizedimg, N);
        
        idctfile = sprintf("%s_idct_qf%d.png",splitFileName(1), qFactor);
        imwrite(idctimage, idctfile);
        
        rgbimg = ycbcr2rgb(idctimage);
    
    
        rgbfile = sprintf("output_%s_qf%d.png",splitFileName(1), qFactor);
        imwrite(rgbimg,rgbfile);
        
        MSEvalue = MSE(img, rgbimg);
        
        disp(MSEvalue);
        
        psnrVal = PSNRvalue(double(MSEvalue));
        
        disp(psnrVal);
    end

end