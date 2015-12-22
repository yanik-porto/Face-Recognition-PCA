clear all
close all
clc

%% Normalize images
fileName = 'namesHorizontal.txt';
nbrPixPerPerson = 5;
images = normImg64(fileName,nbrPixPerPerson);

fileNameV = 'namesVertical.txt';
imagesV = normImg64(fileNameV,nbrPixPerPerson);

nbr_train = 3;
nbr_test = 2;
nbr_pix = 5;
saveImg64(fileName, images, nbr_train, nbr_test);
saveImg64(fileNameV, imagesV, nbr_train, nbr_test);