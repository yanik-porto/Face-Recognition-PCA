function EigVec_k = findPrincipalComp(EigVec,EigVal,thresh,kElmts)

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
condition = 1;

while(condition)
    k=k+1;
    [largEigVal, ind] = max(rowEigVal);
    sumEigVal_k = sumEigVal_k + largEigVal;
    EigVec_k(:,ind) = EigVec(:,ind);
    rowEigVal(ind) = 0;
    ratio = sumEigVal_k/sumEigVal_d;
    
    if(thresh==0)
        condition = (k<kElmts);
    end
    if(kElmts==0)
        condition = (ratio<thresh)&&(k<=4095);
    end
    if(thresh==0 && kElmts==0)
        condition = 0;
    end   
end

EigVec_k( :, ~any(EigVec_k,1) ) = [];  %remove all empty columns
end