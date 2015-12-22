clear all 
close all 
clc

%% Create training data matrix
fileName = 'names.txt';
nbr_train = 3;
[D, X, Itrain] = setTrainingData(fileName,nbr_train);
display('Training Data Matrix OK!');

%% Do PCA on training data matrix
[EigVec, EigVal]=doPCA(D);
display('Eigen Vector OK!');

%% get the PCA transformation matrix Fining the k principal components
[Phi] = findPrincipalComp(EigVec, EigVal, 0.95, 0);
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

%% Split training data
girlNamesChar = ['paola ';'Armine'];
girlNames = cellstr(girlNamesChar);

[indexG] = splitInGroups(X,fileName,girlNames);
