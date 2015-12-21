clear all
close all
clc

%% Normalize images
fileName = 'namesHorizontal.txt';
nbrPixPerPerson = 5;
images = normImg64(fileName,nbrPixPerPerson);

nbr_train = 3;
nbr_test = 2;
nbr_pix = 5;
saveImg64(fileName, images, nbr_train, nbr_test);

%% Create training data matrix
fileName = 'namesHorizontal.txt';
nbr_train = 3;
[D, X, Itrain] = setTrainingData(fileName,nbr_train);

%% Do PCA on training data matrix
[EigVec, EigVal]=doPCA(D);

%% get the PCA transformation matrix Fining the k principal components
[Phi] = findPrincipalComp(EigVec, EigVal, 0.95);

%% Construct the feature vector
for i=1:size(X,3)
    F(:,:,i) = X(:,:,i) * Phi;
end

%% Read test images
nbr_test = 2;
[Xtest, Itest] = readTestImages(fileName, nbr_test);