clear all;
close all;
clc;
%% get names
Lt = importdata('lessNames.txt');
nbr_stu = size(Lt, 1);
nbr_pic = 3;
nbr_img = nbr_stu * nbr_pic;

%% 1. Initialize average locations
Fb=[13 20 ;
    50 20 ;
    34 34 ;
    16 50 ;
    48 50 ];    

Fb_prev = ones(5,2)*100;
threshold = 1;
t=0;

%% 2. Compute transformation     
while(max(max(abs(Fb_prev-Fb)))>threshold)
    %For each picture
    for nth_stu=1:nbr_stu
        for nth_pic = 1:nbr_pic;

            nth_img = (nth_stu-1)*nbr_pic+nth_pic;
            %import data of the predetermined location from the file
            str = [char(Lt(nth_stu,:)),'_', num2str(nth_pic), '.txt'];
            f(:,1:2,nth_img) = importdata(str); %Store in a matrix  

            %Compute the 6 unknowns using svd 
            fp = Fb;                 %set fp by Fbar
            f(:,3,nth_img) = ones(5,1);     %add col of 1s to add b to the equation
            %X = inv(f'*f)*f'*fp;    %Least square solution
            X2(:,:,nth_img) = f(:,:,nth_img)\fp;              %Solution using SVD
            
            %%3. For every face image
            %fpi = fp(:,:,(nth_stu-1)*nbr_pic+nth_pic);
            %fpi(:,3) = ones(5,1); 
            Fprime(:,:,nth_img) = f(:,:,nth_img) * X2(:,:,nth_img);  %Store aligned feature

        end
    end

    %%4. Update the average features locations Fb
    %Reset Fb
    Fb_prev = Fb;
    Fb = zeros(5,2);

    %Compute the average
    for i=1:nbr_img
        Fb = Fb + Fprime(:,:,i);
    end
    Fb = Fb ./ nbr_img;
    
    %%5. while the difference btw the new average and the previous one is
    %%too big, repeat !
    t=t+1;    
end