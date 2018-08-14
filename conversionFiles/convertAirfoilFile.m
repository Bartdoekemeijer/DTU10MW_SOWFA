function [success] = convertAirfoilFile(fileIn,fileOut)
%CONVERTAIRFOILFILE Converts FAST airfoil file to SOWFA airfoil file

success = false;
file = fopen(fileIn,'r');
while (~feof(file))
    inputText = textscan(file,'%s',1,'delimiter','\n');
    inputText = strtrim(cell2mat(inputText{1}));
    if strcmpi(inputText,'!    (deg)      (-)     (-)       (-)')
        nPoints = 105;
        dataClCdCm = cell2mat(textscan(file,'%f %f %f %f',nPoints));
        success = true;
    end
end

if success
    fileID = fopen(fileOut,'w');
    fprintf(fileID,'/*--------------------------------*- C++ -*----------------------------------*\\ \n');
    fprintf(fileID,'| =========                 |                                                 | \n');
    fprintf(fileID,'| \\\\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           | \n');
    fprintf(fileID,'|  \\\\    /   O peration     | Version:  1.6                                   | \n');
    fprintf(fileID,'|   \\\\  /    A nd           | Web:      http://www.OpenFOAM.org               | \n');
    fprintf(fileID,'|    \\\\/     M anipulation  |                                                 | \n');
    fprintf(fileID,['\\*---------------------------------------------------------------------------*/ \n']);
    fprintf(fileID,'FoamFile\n');
    fprintf(fileID,'{\n');
    fprintf(fileID,'    version     2.0;\n');
    fprintf(fileID,'    format      ascii;\n');
    fprintf(fileID,'    class       dictionary;\n');
    fprintf(fileID,'    object      airfoilProperties;\n');
    fprintf(fileID,'}\n');
    fprintf(fileID,'// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //\n');
    fprintf(fileID,'\n');
    fprintf(fileID,'airfoilData\n');
    fprintf(fileID,'(\n');
    fprintf(fileID,'//   alpha   C_l    C_d\n');


    for i = 1:size(dataClCdCm,1)
        fprintf(fileID,['	( ' num2str(dataClCdCm(i,1),'%.2e') ...
                        '	'   num2str(dataClCdCm(i,2),'%.10e') ...
                        '	'   num2str(dataClCdCm(i,3),'%.10e') ' ) \n']);
    end
    fprintf(fileID,');');
    fclose(fileID);
else
    error(['ERROR. Are you sure ' fileIn ' is a FAST airfoil file?']);
end

