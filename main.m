N = 8;
fileID = fopen('MSEs.txt','w');
fclose(fileID);
   
fileID = fopen('PSNRs.txt','w');
fclose(fileID);
for filename = ["pepper.png","alu.tif"]
    splitFileName = strsplit(filename,".");
 
    [img, ~, ~] = imread(filename);
    
    yuvimg = rgb2ycbcr(img);
    
    imwrite(yuvimg, strcat(splitFileName(1),"yuv.png"));
    
    subsampledimage = FourTwoZeroSubSample(yuvimg);
    
    imwrite(subsampledimage, strcat(splitFileName(1),"subbed.png"));
    
    dctimg = DCT(subsampledimage, N);
    
    imwrite(dctimg,strcat(splitFileName(1),"dct.png"));
    
    for qFactor = [5,50,100]
    
        quantizeimg = Quantize(dctimg, qFactor, N);

        quantfile = sprintf("%s_Quantized_Q-%d.png",splitFileName(1), qFactor);
        imwrite(quantizeimg, quantfile);
        
        dequantizedimg = Dequantize(quantizeimg, N, qFactor);
        
        dequantfile = sprintf("%s_Dequantized_Q-%d.png",splitFileName(1), qFactor);
        imwrite(dequantizedimg, dequantfile);
        
        idctimage = IDCT(dequantizedimg, N);
        
        idctfile = sprintf("%s_idct_Q-%d.png",splitFileName(1), qFactor);
        imwrite(idctimage, idctfile);
        
        rgbimg = ycbcr2rgb(idctimage);
    
        rgbfile = sprintf("output_%s_qf%d.png",splitFileName(1), qFactor);
        imwrite(rgbimg,rgbfile);
        
        MSEvalue = MSE(img, rgbimg);
        

        fileID = fopen('MSEs.txt','a');
        fprintf(fileID, "%s_Q-%d.png\t%d\n",splitFileName(1), qFactor, MSEvalue);
        fclose(fileID);
        
        disp(MSEvalue);
        
        psnrVal = PSNRvalue(double(MSEvalue));
        
        fileID = fopen('PSNRs.txt','a');
        fprintf(fileID, "%s_Q-%d.png\t%d\n",splitFileName(1), qFactor, psnrVal);
        fclose(fileID);

        disp(psnrVal);
    end

end
