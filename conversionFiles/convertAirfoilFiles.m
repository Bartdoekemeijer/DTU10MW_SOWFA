clear all; close all; clc;

fileList        = dir(['D:\bmdoekemeijer\My Documents\MATLAB\DTU10MW_SOWFA\' ... 
                       'airfoilProperties\fineAirfoils_RAW\*']);
fileList(end+1) = dir(['D:\bmdoekemeijer\My Documents\MATLAB\DTU10MW_SOWFA\' ...
                       'airfoilProperties\fineAirfoils_RAW\Cyl*']);
                   
for i = 3:length(fileList)
    fileIn  = [fileList(i).folder '/' fileList(i).name];
    fileOut = ['D:\bmdoekemeijer\My Documents\MATLAB\DTU10MW_SOWFA\' ...
                       'airfoilProperties\Implementation2\' fileList(i).name];
    convertAirfoilFile(fileIn,fileOut);
end