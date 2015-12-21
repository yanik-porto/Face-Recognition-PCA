function EigVec_k = findPrincipalComp(EigVec,EigVal,thresh)

%Get the eigenvalues on only 1 row instead of the diagonal
for i=1:size(EigVal,2)
    rowEigVal(i) = EigVal(i,i); 
end

%Compute sum of all eigenvalues and initialize the sum of k's eigenvalues
%with the first one
sumEigVal_d = sum(rowEigVal);
sumEigVal_k = 0;
k=0;
ratio = 0;

while((ratio<thresh)&&(k<=4095))
    k=k+1;
    [largEigVal, ind] = max(rowEigVal);
    sumEigVal_k = sumEigVal_k + largEigVal;
    EigVec_k(:,ind) = EigVec(:,ind);
    rowEigVal(ind) = 0;
    ratio = sumEigVal_k/sumEigVal_d;
end

EigVec_k( :, ~any(EigVec_k,1) ) = [];  %remove all empty columns
end