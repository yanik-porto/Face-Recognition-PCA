clear all;
close all;

%% 1. Set a PCA parameter Npca

%% 3. Get labels
% str='arjun_1.jpg';
% % [L N] = strread(str, '%s %d');
% % [L2 N2] = textscan(str, '%s %d');
% C = strsplit(str, '_');
% list=dir('train_images');
% names=list(4).name;
Lt = importdata('lessNames.txt');
nbr_stu = size(Lt, 1);

%% Create Training data matrix D

for nth_stu = 1 : nbr_stu
    for nth_pic = 1:3
        picName = [char(Lt(nth_stu,:)), '_', num2str(nth_pic), '.jpg'];

        Img = imread(picName);
        I(:,:,(nth_stu-1)*3+nth_pic) = rgb2gray(Img);
        M = size(I, 1);
        N = size(I, 2);

        for i = 1 : M
            X(1,(i*N-(N-1)):((i-1)*N+N),(nth_stu-1)*3+nth_pic) = I(i,:,(nth_stu-1)*3+nth_pic);
            D((nth_stu-1)*3+nth_pic,(i*N-(N-1)):((i-1)*N+N)) = I(i,:,(nth_stu-1)*3+nth_pic);
        end

    end
end

p = nbr_stu * 3;
d = M * N;

%% Do PCA on this matrix
Eps = (1 / (p - 1)) * (double(D') * double(D));