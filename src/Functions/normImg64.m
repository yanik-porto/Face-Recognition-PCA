function [imgs64] = normImg64(fileNames, nPixPerPerson)

%% get names
Names = importdata(fileNames);
nbr_stu = size(Names, 1);

coeffs = getBestCoeffs(Names, nbr_stu, nPixPerPerson);

imgs64 = resizeImgto64(Names, nbr_stu, nPixPerPerson, coeffs);



end