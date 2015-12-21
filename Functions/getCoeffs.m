function [coeffs, normCoor] = getCoeffs(filenameCoor, initCoor)

    f(:,1:2) = importdata(filenameCoor); %Store in a matrix
    
    %Compute the 6 unknowns using svd 
    f(:,3) = ones(5,1);                 %add col of 1s to add b to the equation
    coeffs = f\initCoor;   %Solution using SVD and LMS
    
    %Store aligned feature
    normCoor = f * coeffs; 
end