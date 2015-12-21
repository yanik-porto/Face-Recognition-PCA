clear all 
close all 
clc

%% Create training data matrix
fileName = 'namesHorizontal.txt';
nbr_train = 3;
[D, X, Itrain] = setTrainingData(fileName,nbr_train);
display('Training Data Matrix OK!');

%% Do PCA on training data matrix
[EigVec, EigVal]=doPCA(D);
display('Eigen Vector OK!');

%% get the PCA transformation matrix Fining the k principal components
[Phi] = findPrincipalComp(EigVec, EigVal, 0.95);
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
        err = err+1;
    else
        res = 'wrong';
    end
end
display('Face Detection DONE');

%% Show the two matched images
% figure;
% subplot(121),imshow(uint8(Iq)),title('test image');
% subplot(122),imshow(uint8(Iz)),title('matched train image');
% xlabel(res);

%% Output the correct accuracy
accuracy = (1-err/size(Xtest,3))*100;
display(accuracy);