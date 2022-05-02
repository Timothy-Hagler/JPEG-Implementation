function psnrVal = PSNRvalue(MSE)

psnrVal = 20 * log10((255/sqrt(MSE)));

end