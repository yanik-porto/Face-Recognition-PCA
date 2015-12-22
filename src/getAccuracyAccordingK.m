%% get the PCA transformation matrix Fining the k principal components
for k=5:5:1000
clear Phi
clear F
[Phi] = findPrincipalComp(EigVec, EigVal, 0, k);
display('Principal Components OK!');

%% Construct the feature vector
for i=1:size(X,3)
    F(:,:,i) = X(:,:,i) * Phi;
end
display('Feature Vector OK!');

%% Read test images
nbr_test = 2;
[Xtest, Itest] = readTestImages(fileName, nbr_test);
display('Reading Test Images OK!');

%% Compare the feature vectors
err=0;
for nTest=1:size(Xtest,3)
    Xq = Xtest(:,:,nTest);
    Iq = Itest(:,:,nTest);
    ind=getIndiceOfMatchedImg(Phi, F, Xq);
    Iz = Itrain(:,:,ind);

    %Check if correct or not
    if(ceil(ind/nbr_train) == ceil(nTest/nbr_test))
        res = 'correct';
    else
        res = 'wrong';
        err = err+1;
    end
end
display('Face Detection DONE');

%%  Show the two matched images
% figure;
% subplot(121),imshow(uint8(Iq)),title('test image');
% subplot(122),imshow(uint8(Iz)),title('matched train image');
% xlabel(res);

%% Output the correct accuracy
accuracy(1,k/5) = k;
accuracy(2,k/5) = (1-err/size(Xtest,3))*100;
end

plot(accuracy(1,:),accuracy(2,:));

